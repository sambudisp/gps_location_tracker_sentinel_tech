import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/pages/widgets/widgets.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../core/core.dart';
import '../../setting/core/core.dart';
import '../../setting/domain/domain.dart';
import '../core/core.dart';
import '../managers/bloc.dart';

class LocationTrackerPage extends StatefulWidget {
  const LocationTrackerPage({super.key});

  @override
  State<LocationTrackerPage> createState() => _LocationTrackerPageState();
}

class _LocationTrackerPageState extends State<LocationTrackerPage> with SingleTickerProviderStateMixin {
  // Animation
  late final AnimationController _animationController;
  bool isAnimationPlaying = false;

  // Bloc
  late final LocationTrackerBloc locationTrackerBloc;

  // Duration Timer
  Timer? _durationTimer;
  Duration _elapsed = Duration.zero;

  // Track
  bool _hasTracked = false;

  // Setting
  late final SettingRepository _settingRepository = locator<SettingRepository>();

  @override
  void initState() {
    super.initState();
    locationTrackerBloc = locator<LocationTrackerBloc>();
    _animationController = AnimationController(vsync: this);

    _isKeepScreenOn(isAppRestarted: true);

    // Notification Copy
    WidgetsBinding.instance.addPostFrameCallback((_) {
      locationTrackerBloc.add(
        LocationTrackerEvent.setLocationTrackingNotificationCopy(
          locationTrackingActiveTitle: context.l10n.locationTrackingActiveTitle,
          locationTrackingActiveLabel: context.l10n.locationTrackingActiveLabel,
        ),
      );
    });

    // Restore Tracking
    locationTrackerBloc.add(const LocationTrackerEvent.restoreLocationTracking());
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    _durationTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationTrackerBloc, LocationTrackerState>(
      listener: (context, state) {
        switch (state.stateLocationTracking) {
          case RequestStatus.restored:
            // Calculate duration
            final startedTime = DateTime.parse(state.activeTrackingStartedTime!);
            final elapsed = DateTime.now().difference(startedTime);

            // Handle animation
            _animationController.repeat();
            setState(() {
              _elapsed = elapsed;
              isAnimationPlaying = true;
            });
            _startDurationTimer();
            _isKeepScreenOn();
            break;

          case RequestStatus.error:
            setState(() {
              _animationController.stop();
              isAnimationPlaying = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorCode?.toMessage(context) ?? context.l10n.generalError),
                behavior: SnackBarBehavior.floating,
              ),
            );
            break;

          case RequestStatus.idle:
            if (_hasTracked && state.activeTrackingId == null) {
              _hasTracked = false;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.locationTrackingSavedMessage), behavior: SnackBarBehavior.floating),
              );
            }
            break;

          case RequestStatus.loading:
          case RequestStatus.success:
            break;
        }
      },
      child: Scaffold(
        body: Container(
          decoration: AppDecorations.mainGradientBackground,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.dimens24pt),
              child: Column(
                children: [
                  context.vWhitespace(context.dimens16pt),
                  LocationTrackerHeader(onSettingTap: () => context.pushNamed(SettingRouter.setting)),
                  context.vWhitespace(context.dimens28pt),
                  LocationTrackerCard(animationController: _animationController, formattedDuration: _formattedDuration),
                  context.vWhitespace(context.dimens28pt),
                  LocationHistoryButton(
                    onTap: () {
                      context.pushNamed(LocationTrackerRouter.locationHistory);
                    },
                  ),
                  context.vWhitespace(context.dimens16pt),
                  BlocBuilder<LocationTrackerBloc, LocationTrackerState>(
                    buildWhen: (prev, curr) => prev.activeTrackingId != curr.activeTrackingId,
                    builder: (context, state) {
                      final isTracking = state.activeTrackingId != null && state.activeTrackingId != 0;
                      return TrackNowButton(onTap: _onToggleAnimation, isTracking: isTracking);
                    },
                  ),
                  context.vWhitespace(context.dimens32pt),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onToggleAnimation() {
    if (_animationController.isAnimating) {
      showDialog(
        context: context,
        builder: (context) => CustomDialog.error(
          twoButtonVariants: true,
          title: context.l10n.locationTrackingStopConfirmation,
          onPositiveTap: () {
            _stopTracking();
            setState(() {
              _animationController.stop();
              isAnimationPlaying = false;
            });
          },
        ),
      );
    } else {
      _startTracking();
    }
  }

  void _startDurationTimer() {
    _durationTimer?.cancel();
    _durationTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _elapsed += const Duration(seconds: 1);
      });
    });
  }

  String get _formattedDuration {
    final hours = _elapsed.inHours.toString().padLeft(2, '0');
    final minutes = (_elapsed.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (_elapsed.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  Future<void> _isKeepScreenOn({bool isAppRestarted = false}) async {
    if (isAppRestarted) {
      final state = locationTrackerBloc.state;
      final isTracking = state.activeTrackingId != null && state.activeTrackingId != 0;
      if (!isTracking) return;
    }

    final keepScreenOn = await _settingRepository.isKeepScreenOn();
    keepScreenOn.fold((_) => null, (value) {
      if (value) WakelockPlus.enable();
    });
  }

  void _startTracking() async {
    if (Platform.isAndroid) {
      final notificationPermissionStatus = await Permission.notification.request();
      if (!mounted) return;
      if (notificationPermissionStatus.isDenied || notificationPermissionStatus.isPermanentlyDenied) {
        showDialog(
          context: context,
          builder: (context) => CustomDialog.info(
            twoButtonVariants: true,
            title: context.l10n.permissionIssueTitle,
            description: context.l10n.notificationPermissionDeniedDesc,
            onPositiveTap: () => openAppSettings(),
          ),
        );
        return;
      }
    }

    if (Platform.isIOS) {
      final notificationPermission = await FlutterForegroundTask.requestNotificationPermission();
      if (!mounted) return;
      if (notificationPermission != NotificationPermission.granted) {
        showDialog(
          context: context,
          builder: (context) => CustomDialog.info(
            twoButtonVariants: true,
            title: context.l10n.permissionIssueTitle,
            description: context.l10n.notificationPermissionDeniedDesc,
            onPositiveTap: () => openAppSettings(),
          ),
        );
        return;
      }
    }

    final locationPermissionStatus = await LocationPermissionHelper().handleLocationPermission();
    if (!mounted) return;

    if (locationPermissionStatus != LocationStatus.success) {
      _showLocationIssueDialog(locationPermissionStatus);
      setState(() {
        _animationController.stop();
        isAnimationPlaying = false;
      });
      return;
    }
    _hasTracked = true;
    _startDurationTimer();
    _isKeepScreenOn();

    setState(() {
      _animationController.repeat();
      isAnimationPlaying = true;
    });

    context.read<LocationTrackerBloc>().add(LocationTrackerEvent.startLocationTracking());
  }

  void _stopTracking() {
    WakelockPlus.disable();
    _durationTimer?.cancel();
    setState(() {
      _elapsed = Duration.zero;
    });
    context.read<LocationTrackerBloc>().add(LocationTrackerEvent.stopLocationTracking());
  }

  void _showLocationIssueDialog(LocationStatus status) {
    final l10n = context.l10n;
    final bool isServiceDisabled = status == LocationStatus.serviceDisabled;

    showDialog(
      context: context,
      builder: (context) => CustomDialog.info(
        twoButtonVariants: true,
        title: isServiceDisabled ? l10n.gpsNotActiveTitle : l10n.permissionIssueTitle,
        description: isServiceDisabled
            ? l10n.gpsNotActiveDesc
            : status == LocationStatus.permissionDeniedForever
            ? l10n.permissionDeniedForeverDesc
            : l10n.permissionDeniedDesc,
        onPositiveTap: () {
          if (isServiceDisabled) {
            Geolocator.openLocationSettings();
          } else if (status == LocationStatus.permissionDeniedForever) {
            Geolocator.openAppSettings();
          }
          _stopTracking();
          setState(() {
            _animationController.stop();
            isAnimationPlaying = false;
          });
        },
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/utils/shared_value.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/setting/core/core.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../assets/colors.gen.dart';
import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../setting/domain/domain.dart';
import '../core/core.dart';
import '../core/enums/location_status.dart';
import '../core/helpers/location_permission_helper.dart';
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
        if (state.stateLocationTracking == RequestStatus.restored) {
          // Calculate duration
          final startedTime = DateTime.parse(state.activeTrackingStartedTime!);
          final elapsed = DateTime.now().difference(startedTime);

          _animationController.repeat();
          setState(() {
            _elapsed = elapsed;
            isAnimationPlaying = true;
          });
          _startDurationTimer();
          _isKeepScreenOn();
        }

        if (state.stateLocationTracking == RequestStatus.error) {
          setState(() {
            _animationController.stop();
            isAnimationPlaying = false;
          });
          showDialog(
            context: context,
            builder: (context) => CustomDialog.error(title: state.errorMessage),
          );
        } else if (_hasTracked && state.stateLocationTracking == RequestStatus.idle && state.activeTrackingId == null) {
          _hasTracked = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.locationTrackingSavedMessage), behavior: SnackBarBehavior.floating),
          );
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
                  _header(),
                  context.vWhitespace(context.dimens28pt),
                  _locationTrackingCard(),
                  context.vWhitespace(context.dimens28pt),
                  _locationHistoryButton(),
                  context.vWhitespace(context.dimens16pt),
                  _takeNowButton(),
                  context.vWhitespace(context.dimens32pt),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            context.hWhitespace(42),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${context.l10n.sentinelTech.split(' ').first} ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: '${context.l10n.sentinelTech.split(' ').last} ',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                context.pushNamed(SettingRouter.setting);
              },
              borderRadius: context.borderRadius48pt,
              child: Container(
                padding: EdgeInsets.all(context.dimens10pt),
                decoration: BoxDecoration(color: ColorName.white.withValues(alpha: 0.1), shape: BoxShape.circle),
                child: const Icon(Icons.settings, color: ColorName.white, size: 22),
              ),
            ),
          ],
        ),
        Text(
          context.l10n.appNameTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: 1.2),
        ),
      ],
    );
  }

  Widget _locationTrackingCard() {
    final l10n = context.l10n;
    return Expanded(
      child: BlocBuilder<LocationTrackerBloc, LocationTrackerState>(
        buildWhen: (prev, curr) => prev.activeTrackingId != curr.activeTrackingId,
        builder: (context, state) {
          final isTracking = state.activeTrackingId != null && state.activeTrackingId != 0;
          final instructionLabel = isTracking
              ? l10n.locationTrackingActiveLabel
              : l10n.locationTrackingInstructionLabel;

          return Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 40),
            decoration: BoxDecoration(color: ColorName.white, borderRadius: context.borderRadius28pt),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.durationLabel,
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      _formattedDuration,
                      style: TextStyle(color: ColorName.primary, fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                const Spacer(),
                _animationBackground(),
                const Spacer(),
                Text(
                  instructionLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorName.black, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _animationBackground() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(color: ColorName.secondary.withValues(alpha: 0.6), shape: BoxShape.circle),
      child: Center(
        child: Lottie.asset(
          'assets/lottie/walking.json',
          controller: _animationController,
          onLoaded: (composition) {
            _animationController.duration = composition.duration;
          },
        ),
      ),
    );
  }

  Widget _locationHistoryButton() {
    return InkWell(
      onTap: () {
        context.pushNamed(LocationTrackerRouter.locationHistory);
      },
      child: Container(
        height: 54,
        decoration: BoxDecoration(color: ColorName.primaryAlt, borderRadius: context.borderRadius100pt),
        child: Center(
          child: Text(
            context.l10n.locationHistoryLabel.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 1.2),
          ),
        ),
      ),
    );
  }

  Widget _takeNowButton() {
    final l10n = context.l10n;
    return BlocBuilder<LocationTrackerBloc, LocationTrackerState>(
      buildWhen: (prev, curr) => prev.activeTrackingId != curr.activeTrackingId,
      builder: (context, state) {
        final isTracking = state.activeTrackingId != null && state.activeTrackingId != 0;
        final buttonTrackLabel = isTracking ? l10n.stopTrackLabel : l10n.trackNowLabel;

        return InkWell(
          onTap: _onToggleAnimation,
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: isTracking ? ColorName.coralRed : ColorName.yellow,
              borderRadius: context.borderRadius100pt,
            ),
            child: Center(
              child: Text(
                buttonTrackLabel.toUpperCase(),
                style: TextStyle(
                  color: isTracking ? ColorName.white : ColorName.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        );
      },
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

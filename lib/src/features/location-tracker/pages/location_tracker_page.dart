import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/utils/shared_value.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/setting/core/core.dart';
import 'package:lottie/lottie.dart';

import '../../../../assets/colors.gen.dart';
import '../../../components/components.dart';
import '../../../core/core.dart';
import '../core/core.dart';
import '../managers/bloc.dart';

class LocationTrackerPage extends StatefulWidget {
  const LocationTrackerPage({super.key});

  @override
  State<LocationTrackerPage> createState() => _LocationTrackerPageState();
}

class _LocationTrackerPageState extends State<LocationTrackerPage> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool isAnimationPlaying = false;
  late final LocationTrackerBloc locationTrackerBloc;

  @override
  void initState() {
    super.initState();
    locationTrackerBloc = locator<LocationTrackerBloc>();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationTrackerBloc, LocationTrackerState>(
      listener: (context, state) {
        if (state.stateLocationTracking == DbStatus.error) {
          setState(() {
            _animationController.stop();
            isAnimationPlaying = false;
          });
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage ?? 'Terjadi kesalahan')));
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
    return Expanded(
      child: Container(
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
                  '00:00:59',
                  style: TextStyle(color: ColorName.primary, fontSize: 22, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const Spacer(),
            _animationBackground(),
            const Spacer(),
            Text(
              context.l10n.locationTrackingInstructionLabel,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorName.black, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
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
            context.l10n.locationHistoryLabel,
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 1.2),
          ),
        ),
      ),
    );
  }

  Widget _takeNowButton() {
    return InkWell(
      onTap: _onToggleAnimation,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(color: ColorName.yellow, borderRadius: context.borderRadius100pt),
        child: Center(
          child: Text(
            context.l10n.trackNowLabel,
            style: TextStyle(color: Color(0xFF5A3A00), fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: 1.5),
          ),
        ),
      ),
    );
  }

  void _onToggleAnimation() {
    if (_animationController.isAnimating) {
      showDialog(
        context: context,
        builder: (context) => CustomDialog.info(
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
      setState(() {
        _animationController.repeat();
        isAnimationPlaying = true;
      });
    }
  }

  void _startTracking() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Izin lokasi ditolak')));
      // stop animasi
      setState(() {
        _animationController.stop();
        isAnimationPlaying = false;
      });
      return;
    }

    context.read<LocationTrackerBloc>().add(LocationTrackerEvent.startLocationTracking());
  }

  void _stopTracking() {
    context.read<LocationTrackerBloc>().add(LocationTrackerEvent.stopLocationTracking());
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return false;
    }

    if (permission == LocationPermission.deniedForever) return false;

    return true;
  }
}

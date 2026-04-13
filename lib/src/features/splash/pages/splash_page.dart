import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_location_tracker_sentinel_tech/assets/colors.gen.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/core/core.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../../assets/assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.goNamed(LocationTrackerRouter.locationTracker);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final logo = Assets.icons.gpsIcon.svg(height: 164, width: 164);
    final l10n = context.l10n;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            logo
                .animate(
                  onPlay: (controller) {
                    controller.repeat();
                  },
                )
                .shimmer(duration: 2000.ms),
            context.vWhitespace(28),
            Text(
              l10n.appNameTitle.capitalizeWords(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 2.5, color: ColorName.black),
            ),
            context.vWhitespace(10),
            Container(width: 40, height: 1, color: ColorName.darkGrey),
            context.vWhitespace(10),
            Text(
              l10n.sentinelTech.capitalizeWords(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 4.0,
                color: ColorName.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

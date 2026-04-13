import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../assets/colors.gen.dart';

class LocationTrackerAnimation extends StatelessWidget {
  final AnimationController controller;

  const LocationTrackerAnimation({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(color: ColorName.secondary.withValues(alpha: 0.6), shape: BoxShape.circle),
      child: Center(
        child: Lottie.asset(
          'assets/lottie/walking.json',
          controller: controller,
          onLoaded: (composition) {
            controller.duration = composition.duration;
          },
        ),
      ),
    );
  }
}

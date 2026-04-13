import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../../../assets/colors.gen.dart';
import '../../../managers/bloc.dart';
import 'location_tracker_animation.dart';

class LocationTrackerCard extends StatelessWidget {
  final AnimationController animationController;
  final String formattedDuration;

  const LocationTrackerCard({super.key, required this.animationController, required this.formattedDuration});

  @override
  Widget build(BuildContext context) {
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
                      l10n.durationLabel,
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      formattedDuration,
                      style: TextStyle(color: ColorName.primary, fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                const Spacer(),
                LocationTrackerAnimation(controller: animationController),
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
}

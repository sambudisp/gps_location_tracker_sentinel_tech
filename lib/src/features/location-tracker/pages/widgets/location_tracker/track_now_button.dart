import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../../../assets/colors.gen.dart';

class TrackNowButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isTracking;

  const TrackNowButton({super.key, required this.onTap, required this.isTracking});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final buttonTrackLabel = isTracking ? l10n.stopTrackLabel : l10n.trackNowLabel;

    return InkWell(
      onTap: onTap,
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
  }
}

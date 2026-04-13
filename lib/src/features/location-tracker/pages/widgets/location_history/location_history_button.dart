import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../../../assets/colors.gen.dart';

class LocationHistoryButton extends StatelessWidget {
  final VoidCallback onTap;

  const LocationHistoryButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
}

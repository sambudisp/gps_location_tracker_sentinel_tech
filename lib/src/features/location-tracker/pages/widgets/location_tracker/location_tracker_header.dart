import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../../../assets/colors.gen.dart';

class LocationTrackerHeader extends StatelessWidget {
  final VoidCallback onSettingTap;

  const LocationTrackerHeader({super.key, required this.onSettingTap});

  @override
  Widget build(BuildContext context) {
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: '${context.l10n.sentinelTech.split(' ').last} ',
                    style: const TextStyle(
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
              onTap: onSettingTap,
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
}

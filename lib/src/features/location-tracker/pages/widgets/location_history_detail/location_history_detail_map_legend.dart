import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../../../assets/colors.gen.dart';

class LocationHistoryDetailMapLegend extends StatelessWidget {
  const LocationHistoryDetailMapLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: context.borderRadius28pt,
        boxShadow: [BoxShadow(color: ColorName.black.withValues(alpha: 0.08), blurRadius: 6)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _legendDot(ColorName.green),
          context.hWhitespace(4),
          Text(
            l10n.startLabel,
            style: const TextStyle(fontSize: 10, color: ColorName.black, fontWeight: FontWeight.w600),
          ),
          context.hWhitespace(10),
          _legendDot(ColorName.coralRed),
          context.hWhitespace(4),
          Text(
            l10n.endLabel,
            style: const TextStyle(fontSize: 10, color: ColorName.black, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _legendDot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

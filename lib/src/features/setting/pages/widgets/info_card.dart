import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../../assets/colors.gen.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String trailing;

  const InfoCard({super.key, required this.icon, required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Icon(icon, color: ColorName.primary, size: 18),
          context.hWhitespace(10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: ColorName.darkBlue, fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          Text(trailing, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

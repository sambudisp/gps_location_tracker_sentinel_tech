import 'package:flutter/material.dart';

import '../../../../../../assets/colors.gen.dart';

class LocationHistoryDetailStatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const LocationHistoryDetailStatItem({super.key, required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: ColorName.primary, size: 16),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(color: ColorName.black, fontSize: 12, fontWeight: FontWeight.w800),
          ),
          Text(label, style: const TextStyle(color: ColorName.darkGrey, fontSize: 10)),
        ],
      ),
    );
  }
}

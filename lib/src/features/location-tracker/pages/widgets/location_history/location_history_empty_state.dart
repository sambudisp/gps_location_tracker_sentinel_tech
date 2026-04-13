import 'package:flutter/material.dart';

import '../../../../../../assets/colors.gen.dart';

class LocationHistoryEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const LocationHistoryEmptyState({super.key, required this.icon, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: ColorName.primary, size: 48),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(color: ColorName.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            body,
            textAlign: TextAlign.center,
            style: const TextStyle(color: ColorName.darkGrey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

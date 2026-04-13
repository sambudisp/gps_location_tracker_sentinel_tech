import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../assets/colors.gen.dart';

class ToggleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isLoading;

  const ToggleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: isLoading ? const _ToggleShimmer() : _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: ColorName.primary, size: 18),
        context.hWhitespace(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: ColorName.darkBlue, fontSize: 14, fontWeight: FontWeight.w700),
              ),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12, height: 1.4)),
            ],
          ),
        ),
        context.hWhitespace(10),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white,
          activeTrackColor: ColorName.primary,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: const Color(0xFFDDDDDD),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }
}

class _ToggleShimmer extends StatelessWidget {
  const _ToggleShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F5),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
          ),
          context.hWhitespace(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 12,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                ),
                context.vWhitespace(6),
                Container(
                  width: 160,
                  height: 10,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                ),
              ],
            ),
          ),
          context.hWhitespace(10),
          Container(
            width: 44,
            height: 24,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
          ),
        ],
      ),
    );
  }
}

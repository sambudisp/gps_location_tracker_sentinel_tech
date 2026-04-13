import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../assets/colors.gen.dart';

class ChipCard<T> extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<T> values;
  final T selected;
  final String Function(T) labelOf;
  final ValueChanged<T> onChanged;
  final bool isLoading;

  const ChipCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.values,
    required this.selected,
    required this.labelOf,
    required this.onChanged,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: ColorName.primary, size: 18),
              context.hWhitespace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(color: ColorName.black, fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          context.vWhitespace(12),
          isLoading ? const _ChipShimmer() : _buildChips(context),
        ],
      ),
    );
  }

  Widget _buildChips(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: values.map((v) {
        final isSelected = v == selected;
        return GestureDetector(
          onTap: () => onChanged(v),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: isSelected ? ColorName.primary : const Color(0xFFF0F4F8),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              labelOf(v),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ChipShimmer extends StatelessWidget {
  const _ChipShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F5),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [40.0, 50.0, 45.0, 35.0].map((width) {
          return Container(
            width: width,
            height: 30,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
          );
        }).toList(),
      ),
    );
  }
}

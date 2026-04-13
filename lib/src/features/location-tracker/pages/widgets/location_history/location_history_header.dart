import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../../../assets/colors.gen.dart';
import '../../../data/data.dart';

class LocationHistoryHeader extends StatelessWidget {
  final List<TrackedLocationDataModel> items;
  final VoidCallback onDeleteAll;

  const LocationHistoryHeader({super.key, required this.items, required this.onDeleteAll});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final hasCompletedItems = items.any((item) => item.stoppedTime != null);
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${items.length} ${l10n.sessionLabel.toLowerCase()}${items.length != 1 ? 's' : ''}',
            style: const TextStyle(color: ColorName.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
          if (hasCompletedItems)
            GestureDetector(
              onTap: onDeleteAll,
              child: Text(
                l10n.deleteAllLabel,
                style: const TextStyle(color: ColorName.red, fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
        ],
      ),
    );
  }
}

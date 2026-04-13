import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../../../assets/colors.gen.dart';
import '../../../core/core.dart';
import '../../../data/data.dart';

class LocationHistoryItem extends StatelessWidget {
  final TrackedLocationDataModel item;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const LocationHistoryItem({super.key, required this.item, required this.onDelete, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final start = DateTime.parse(item.startedTime);
    final end = item.stoppedTime != null ? DateTime.parse(item.stoppedTime!) : null;
    final l10n = context.l10n;

    return Dismissible(
      key: Key(item.id.toString()),
      direction: end != null ? DismissDirection.endToStart : DismissDirection.none,
      confirmDismiss: (_) async {
        if (end != null) onDelete();
        return false;
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(color: ColorName.red, borderRadius: context.borderRadius12pt),
        child: const Icon(Icons.delete_outline, color: ColorName.white, size: 22),
      ),
      child: GestureDetector(
        onTap: end != null ? onTap : null,
        child: Container(
          margin: const EdgeInsets.only(bottom: 6),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(color: ColorName.white, borderRadius: context.borderRadius12pt),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: end != null ? ColorName.primary : ColorName.green,
                  shape: BoxShape.circle,
                ),
              ),
              context.hWhitespace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.trackedLocTitle(item.id.toString()),
                      style: const TextStyle(color: ColorName.black, fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    context.vWhitespace(4),
                    Text(
                      end != null
                          ? '${TimeHelper().formatTime(start)} — ${TimeHelper().formatTime(end)}  ·  ${TimeHelper().duration(item.duration)}'
                          : '${TimeHelper().formatTime(start)} — ${l10n.ongoingLabel}',
                      style: TextStyle(color: end != null ? ColorName.darkGrey : ColorName.green, fontSize: 10),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: ColorName.darkGrey, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

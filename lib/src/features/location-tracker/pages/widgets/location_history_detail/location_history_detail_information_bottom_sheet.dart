import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../../../assets/colors.gen.dart';
import '../../../core/core.dart';
import '../../../data/data.dart';
import '../widgets.dart';

class LocationHistoryDetailInformationBottomSheet extends StatelessWidget {
  final TrackedLocationDataModel data;
  final int totalDetails;
  final DateTime start;
  final DateTime? end;
  final String? accuracy;

  const LocationHistoryDetailInformationBottomSheet({
    super.key,
    required this.data,
    required this.totalDetails,
    required this.start,
    required this.end,
    required this.accuracy,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.vertical(bottom: context.radius20pt),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.trackedLocTitle(data.id.toString()),
            style: const TextStyle(color: ColorName.black, fontSize: 14, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 2),
          Text(
            end != null
                ? '${TimeHelper().formatDate(start.toString())}  ·  ${TimeHelper().formatTime(start)} — ${TimeHelper().formatTime(end!)}'
                : '${TimeHelper().formatDate(start.toString())}  ·  ${TimeHelper().formatTime(start)} — ongoing',
            style: const TextStyle(color: ColorName.darkGrey, fontSize: 10),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              LocationHistoryDetailStatItem(
                icon: Icons.timer_outlined,
                value: TimeHelper().duration(data.duration),
                label: l10n.durationLabel,
              ),
              Container(width: 1, height: 36, color: ColorName.divGrey),
              LocationHistoryDetailStatItem(
                icon: Icons.gps_fixed_sharp,
                value: accuracy.capitalizeWords() ?? '-',
                label: l10n.accuracyLabel,
              ),
              Container(width: 1, height: 36, color: ColorName.divGrey),
              LocationHistoryDetailStatItem(
                icon: Icons.pin_drop_outlined,
                value: totalDetails.toString(),
                label: l10n.recordsLabel,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

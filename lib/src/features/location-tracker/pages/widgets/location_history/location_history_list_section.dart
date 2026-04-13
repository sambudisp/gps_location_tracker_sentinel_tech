import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/pages/widgets/widgets.dart';

import '../../../../../../assets/colors.gen.dart';
import '../../../data/data.dart';
import 'location_history.dart';

class LocationHistorySection extends StatelessWidget {
  final String sectionDate;
  final List<TrackedLocationDataModel> sessions;
  final void Function(TrackedLocationDataModel) onDelete;
  final void Function(TrackedLocationDataModel) onTap;

  const LocationHistorySection({
    super.key,
    required this.sectionDate,
    required this.sessions,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 6),
          child: Text(
            sectionDate,
            style: const TextStyle(color: ColorName.darkGrey, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
        ...sessions.map(
          (item) => LocationHistoryItem(item: item, onDelete: () => onDelete(item), onTap: () => onTap(item)),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/pages/widgets/widgets.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../assets/colors.gen.dart';
import '../../../core/core.dart';
import '../core/core.dart';
import '../data/data.dart';
import '../managers/bloc.dart';

class LocationHistoryPage extends StatefulWidget {
  const LocationHistoryPage({super.key});

  @override
  State<LocationHistoryPage> createState() => _LocationHistoryPageState();
}

class _LocationHistoryPageState extends State<LocationHistoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<LocationTrackerBloc>().add(const LocationTrackerEvent.getTrackedLocationHistory());
  }

  Map<DateTime, List<TrackedLocationDataModel>> _grouped(List<TrackedLocationDataModel> items) {
    final map = <DateTime, List<TrackedLocationDataModel>>{};
    for (final item in items) {
      final date = DateTime.parse(item.startedTime);
      final dateOnly = DateTime(date.year, date.month, date.day);
      map.putIfAbsent(dateOnly, () => []).add(item);
    }
    return Map.fromEntries(map.entries.toList()..sort((a, b) => b.key.compareTo(a.key)));
  }

  String _formatSectionDate(DateTime date) {
    final l10n = context.l10n;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    if (date == today) return l10n.todayLabel;
    if (date == yesterday) return l10n.yesterdayLabel;
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  void _confirmDelete(TrackedLocationDataModel item) {
    final l10n = context.l10n;
    showDialog(
      context: context,
      builder: (_) => CustomDialog.info(
        twoButtonVariants: true,
        title: l10n.deleteTrackedLocationConfirmationTitle,
        description: l10n.deleteTrackedLocationConfirmationBody(item.id.toString()),
        onPositiveTap: () {
          context.read<LocationTrackerBloc>().add(LocationTrackerEvent.deleteTrackedLocationHistory(id: item.id));
        },
      ),
    );
  }

  void _confirmDeleteAll() {
    final l10n = context.l10n;
    showDialog(
      context: context,
      builder: (_) => CustomDialog.info(
        twoButtonVariants: true,
        title: l10n.deleteAllDataConfirmationTitle,
        description: l10n.deleteAllDataConfirmationBody,
        onPositiveTap: () {
          context.read<LocationTrackerBloc>().add(LocationTrackerEvent.deleteAllTrackedLocationHistory());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<LocationTrackerBloc, LocationTrackerState>(
      listenWhen: (prev, curr) => prev.stateDeleteTrackedLocationHistory != curr.stateDeleteTrackedLocationHistory,
      listener: (context, state) {
        if (state.stateDeleteTrackedLocationHistory == RequestStatus.success) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.dataDeletedMessage), behavior: SnackBarBehavior.floating));
        } else if (state.stateDeleteTrackedLocationHistory == RequestStatus.error ||
            state.stateTrackedLocationHistory == RequestStatus.error ||
            state.stateTrackedLocationHistoryDetail == RequestStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorCode?.toMessage(context) ?? l10n.generalError),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      buildWhen: (prev, curr) =>
          prev.stateTrackedLocationHistory != curr.stateTrackedLocationHistory ||
          prev.trackedLocationHistory != curr.trackedLocationHistory,
      builder: (context, state) {
        final items = state.trackedLocationHistory;
        final grouped = _grouped(items);

        return Scaffold(
          body: Container(
            decoration: AppDecorations.mainGradientBackground,
            child: SafeArea(
              child: Column(
                children: [
                  CustomAppBar(title: l10n.locationHistoryLabel),
                  context.vWhitespace(4),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: context.borderRadius20pt,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        decoration: BoxDecoration(color: ColorName.grey, borderRadius: context.borderRadius20pt),
                        child: Column(
                          children: [
                            LocationHistoryHeader(items: items, onDeleteAll: _confirmDeleteAll),
                            Expanded(
                              child: state.stateTrackedLocationHistory == RequestStatus.loading
                                  ? const Center(child: CircularProgressIndicator(color: ColorName.primary))
                                  : items.isEmpty
                                  ? LocationHistoryEmptyState(
                                      icon: Icons.location_off_outlined,
                                      title: context.l10n.emptyStateTitle,
                                      body: context.l10n.emptyStateBody,
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                                      itemCount: grouped.length,
                                      itemBuilder: (context, i) {
                                        final date = grouped.keys.elementAt(i);
                                        final sessions = grouped[date]!;
                                        return LocationHistorySection(
                                          sectionDate: _formatSectionDate(date),
                                          sessions: sessions,
                                          onDelete: _confirmDelete,
                                          onTap: (item) => context.pushNamed(
                                            LocationTrackerRouter.locationHistoryDetail,
                                            extra: item,
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

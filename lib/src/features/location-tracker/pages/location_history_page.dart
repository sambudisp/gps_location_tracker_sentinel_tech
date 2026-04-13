import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_location_tracker_sentinel_tech/src/components/components.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/utils/shared_value.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/core/core.dart';

import '../../../../assets/colors.gen.dart';
import '../../../core/core.dart';
import '../core/helpers/time_helper.dart';
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
    return BlocConsumer<LocationTrackerBloc, LocationTrackerState>(
      listenWhen: (prev, curr) => prev.stateDeleteTrackedLocationHistory != curr.stateDeleteTrackedLocationHistory,
      listener: (context, state) {
        if (state.stateDeleteTrackedLocationHistory == RequestStatus.success) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(context.l10n.dataDeletedMessage), behavior: SnackBarBehavior.floating));
        } else if (state.stateDeleteTrackedLocationHistory == RequestStatus.error ||
            state.stateTrackedLocationHistory == RequestStatus.error ||
            state.stateTrackedLocationHistoryDetail == RequestStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorCode?.toMessage(context) ?? context.l10n.generalError),
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
                  _appBar(),
                  context.vWhitespace(4),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: context.borderRadius20pt,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        decoration: BoxDecoration(color: ColorName.grey, borderRadius: context.borderRadius20pt),
                        child: Column(
                          children: [
                            _header(items),
                            Expanded(
                              child: state.stateTrackedLocationHistory == RequestStatus.loading
                                  ? const Center(child: CircularProgressIndicator(color: ColorName.primary))
                                  : items.isEmpty
                                  ? _emptyState()
                                  : ListView.builder(
                                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                                      itemCount: grouped.length,
                                      itemBuilder: (context, i) {
                                        final date = grouped.keys.elementAt(i);
                                        final sessions = grouped[date]!;
                                        return _listSection(date, sessions);
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

  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(color: ColorName.white.withValues(alpha: 0.15), shape: BoxShape.circle),
              child: const Icon(Icons.arrow_back, color: ColorName.white, size: 18),
            ),
          ),
          Expanded(
            child: Text(
              context.l10n.locationHistoryLabel,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorName.white, fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
          context.hWhitespace(16),
        ],
      ),
    );
  }

  Widget _header(List<TrackedLocationDataModel> items) {
    final hasCompletedItems = items.any((item) => item.stoppedTime != null);
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${items.length} ${context.l10n.sessionLabel.toLowerCase()}${items.length != 1 ? 's' : ''}',
            style: TextStyle(color: ColorName.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
          if (hasCompletedItems)
            GestureDetector(
              onTap: _confirmDeleteAll,
              child: Text(
                context.l10n.deleteAllLabel,
                style: TextStyle(color: ColorName.red, fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
        ],
      ),
    );
  }

  Widget _listSection(DateTime date, List<TrackedLocationDataModel> sessions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 6),
          child: Text(
            _formatSectionDate(date),
            style: const TextStyle(color: ColorName.darkGrey, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
        ...sessions.map((item) => _historyItem(item)),
      ],
    );
  }

  Widget _historyItem(TrackedLocationDataModel item) {
    final start = DateTime.parse(item.startedTime);
    final end = item.stoppedTime != null ? DateTime.parse(item.stoppedTime!) : null;
    final l10n = context.l10n;

    return Dismissible(
      key: Key(item.id.toString()),
      direction: end != null ? DismissDirection.endToStart : DismissDirection.none,
      confirmDismiss: (_) async {
        if (end != null) _confirmDelete(item);
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
        onTap: () {
          if (end != null) context.pushNamed(LocationTrackerRouter.locationHistoryDetail, extra: item);
        },
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

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_off_outlined, color: ColorName.primary, size: 48),
          context.vWhitespace(12),
          Text(
            context.l10n.emptyStateTitle,
            style: TextStyle(color: ColorName.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          context.vWhitespace(4),
          Text(
            context.l10n.emptyStateBody,
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorName.darkGrey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

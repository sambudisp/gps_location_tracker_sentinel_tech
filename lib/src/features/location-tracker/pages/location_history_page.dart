import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_location_tracker_sentinel_tech/assets/colors.gen.dart';
import 'package:gps_location_tracker_sentinel_tech/src/components/components.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/constants/app_decoration.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/utils/shared_value.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/core/core.dart';

class LocationHistoryModel {
  final String id;
  final String title;
  final DateTime startTime;
  final DateTime endTime;

  const LocationHistoryModel({required this.id, required this.title, required this.startTime, required this.endTime});

  String get duration {
    final diff = endTime.difference(startTime);
    final h = diff.inHours;
    final m = diff.inMinutes % 60;
    if (h > 0) return '${h}h ${m}m';
    return '${m}m';
  }
}

final List<LocationHistoryModel> _dummyData = [
  LocationHistoryModel(
    id: '1',
    title: 'Morning commute',
    startTime: DateTime(2026, 4, 11, 8, 12),
    endTime: DateTime(2026, 4, 11, 8, 47),
  ),
  LocationHistoryModel(
    id: '2',
    title: 'Office area patrol',
    startTime: DateTime(2026, 4, 11, 10, 30),
    endTime: DateTime(2026, 4, 11, 11, 15),
  ),
  LocationHistoryModel(
    id: '3',
    title: 'Lunch run',
    startTime: DateTime(2026, 4, 11, 12, 5),
    endTime: DateTime(2026, 4, 11, 12, 38),
  ),
  LocationHistoryModel(
    id: '4',
    title: 'Field visit',
    startTime: DateTime(2026, 4, 10, 14, 0),
    endTime: DateTime(2026, 4, 10, 16, 22),
  ),
  LocationHistoryModel(
    id: '5',
    title: 'Client meeting route',
    startTime: DateTime(2026, 4, 10, 9, 0),
    endTime: DateTime(2026, 4, 10, 9, 45),
  ),
  LocationHistoryModel(
    id: '6',
    title: 'Evening walk',
    startTime: DateTime(2026, 1, 2, 18, 0),
    endTime: DateTime(2026, 1, 2, 18, 40),
  ),
  LocationHistoryModel(
    id: '7',
    title: 'Evening walk 2',
    startTime: DateTime(2026, 1, 2, 18, 0),
    endTime: DateTime(2026, 1, 2, 18, 40),
  ),
  LocationHistoryModel(
    id: '8',
    title: 'Evening walk 2',
    startTime: DateTime(2026, 1, 2, 18, 0),
    endTime: DateTime(2026, 1, 2, 18, 40),
  ),
  LocationHistoryModel(
    id: '9',
    title: 'Evening walk 2',
    startTime: DateTime(2026, 1, 2, 18, 0),
    endTime: DateTime(2026, 1, 2, 18, 40),
  ),
  LocationHistoryModel(
    id: '10',
    title: 'Evening walk 2',
    startTime: DateTime(2026, 1, 2, 18, 0),
    endTime: DateTime(2026, 1, 2, 18, 40),
  ),
  LocationHistoryModel(
    id: '11',
    title: 'Evening walk 2',
    startTime: DateTime(2026, 1, 2, 18, 0),
    endTime: DateTime(2026, 1, 2, 18, 40),
  ),
  LocationHistoryModel(
    id: '12',
    title: 'Evening walk 2',
    startTime: DateTime(2026, 1, 2, 18, 0),
    endTime: DateTime(2026, 1, 2, 18, 40),
  ),
];

class LocationHistoryPage extends StatefulWidget {
  const LocationHistoryPage({super.key});

  @override
  State<LocationHistoryPage> createState() => _LocationHistoryPageState();
}

class _LocationHistoryPageState extends State<LocationHistoryPage> {
  late List<LocationHistoryModel> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(_dummyData);
  }

  // ─── Helpers ───────────────────────────────────────────────────────────────

  Map<DateTime, List<LocationHistoryModel>> get _grouped {
    final map = <DateTime, List<LocationHistoryModel>>{};
    for (final item in _items) {
      final date = DateTime(item.startTime.year, item.startTime.month, item.startTime.day);
      map.putIfAbsent(date, () => []).add(item);
    }
    return Map.fromEntries(map.entries.toList()..sort((a, b) => b.key.compareTo(a.key)));
  }

  String _formatSectionDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    if (date == today) return 'Today';
    if (date == yesterday) return 'Yesterday';
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String _formatItemDate(DateTime dt) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${dt.day} ${months[dt.month - 1]} ${dt.year}';
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  // ─── Actions ───────────────────────────────────────────────────────────────

  void _deleteItem(LocationHistoryModel item) {
    setState(() => _items.removeWhere((e) => e.id == item.id));
  }

  void _confirmDelete(LocationHistoryModel item) {
    showDialog(
      context: context,
      builder: (_) => CustomDialog.info(
        twoButtonVariants: true,
        title: 'Are you sure want to delete?',
        description: '"${item.title}" will be permanently deleted. This action cannot be undone.',
        onPositiveTap: () => _deleteItem(item),
      ),
    );
  }

  void _confirmDeleteAll() {
    showDialog(
      context: context,
      builder: (_) => CustomDialog.info(
        twoButtonVariants: true,
        title: 'Are you sure want to delete all?',
        description: 'All location history will be permanently deleted. This action cannot be undone.',
        onPositiveTap: () => setState(() => _items.clear()),
      ),
    );
  }

  // ─── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final grouped = _grouped;

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
                        _header(),
                        Expanded(
                          child: _items.isEmpty
                              ? _emptyState()
                              : ListView.builder(
                                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                                  itemCount: grouped.length,
                                  itemBuilder: (context, i) {
                                    final date = grouped.keys.elementAt(i);
                                    final sessions = grouped[date]!;
                                    return _buildSection(date, sessions);
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
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), shape: BoxShape.circle),
              child: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
            ),
          ),
          Expanded(
            child: Text(
              context.l10n.locationHistoryLabel,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
          context.hWhitespace(16),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${_items.length} ${context.l10n.sessionLabel.toLowerCase()}${_items.length != 1 ? 's' : ''}',
            style: TextStyle(color: ColorName.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
          if (_items.isNotEmpty)
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

  Widget _buildSection(DateTime date, List<LocationHistoryModel> sessions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 6),
          child: Text(
            _formatSectionDate(date),
            style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
        ...sessions.map((item) => _historyItem(item)),
      ],
    );
  }

  Widget _historyItem(LocationHistoryModel item) {
    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        _confirmDelete(item);
        return false;
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(color: ColorName.red, borderRadius: context.borderRadius12pt),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 22),
      ),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(LocationTrackerRouter.locationHistoryDetail);
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
                decoration: const BoxDecoration(color: ColorName.primary, shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tracked Loc. ${item.id}',
                      style: const TextStyle(color: ColorName.black, fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    context.vWhitespace(4),
                    Text(
                      '${_formatTime(item.startTime)} — ${_formatTime(item.endTime)}  ·  ${item.duration}',
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
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
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

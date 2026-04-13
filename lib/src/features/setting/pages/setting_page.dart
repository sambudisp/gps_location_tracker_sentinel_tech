import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/utils/shared_value.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/setting/managers/bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../assets/colors.gen.dart';
import '../../../core/core.dart';
import '../../location-tracker/managers/bloc.dart';
import '../data/data.dart';

extension TrackingIntervalLabel on GpsTrackingInterval {
  String get label {
    switch (this) {
      case GpsTrackingInterval.s5:
        return '5s';
      case GpsTrackingInterval.s10:
        return '10s';
      case GpsTrackingInterval.s30:
        return '30s';
      case GpsTrackingInterval.m1:
        return '1m';
    }
  }
}

extension GpsAccuracyLabel on GpsAccuracy {
  String get label {
    switch (this) {
      case GpsAccuracy.lowest:
        return 'Lowest';
      case GpsAccuracy.low:
        return 'Low';
      case GpsAccuracy.medium:
        return 'Medium';
      case GpsAccuracy.high:
        return 'High';
      case GpsAccuracy.best:
        return 'Best';
    }
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String _appVersion = '';
  bool _isPageReady = false;

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = '${info.version} (${info.buildNumber})';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<SettingBloc>()
        ..add(SettingEvent.getGpsTrackingInterval())
        ..add(SettingEvent.getGpsAccuracy())
        ..add(SettingEvent.isKeepScreenOn()),
      child: BlocConsumer<SettingBloc, SettingState>(
        listener: (context, state) {
          if (state.intervalState == RequestStatus.error ||
              state.accuracyState == RequestStatus.error ||
              state.keepScreenOnState == RequestStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorCode?.toMessage(context) ?? context.l10n.generalError),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          final interval = state.interval ?? GpsTrackingInterval.s10;
          final accuracy = state.accuracy ?? GpsAccuracy.medium;
          final l10n = context.l10n;
          final isTracking =
              locator<LocationTrackerBloc>().state.activeTrackingId != null &&
              locator<LocationTrackerBloc>().state.activeTrackingId != 0;

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
                          child: ListView(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                            children: [
                              isTracking
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 4, bottom: 8),
                                      child: Text(
                                        l10n.settingTrackingWarningDesc,
                                        style: TextStyle(
                                          color: ColorName.coralRed.withValues(alpha: 0.8),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    )
                                  : SizedBox.shrink(),
                              _sectionLabel(l10n.trackingLabel),
                              _chipCard<GpsTrackingInterval>(
                                icon: Icons.timer_outlined,
                                title: l10n.intervalLabel,
                                subtitle: l10n.intervalDesc,
                                values: GpsTrackingInterval.values,
                                selected: interval,
                                labelOf: (v) => v.label,
                                onChanged: (v) => setState(() {
                                  context.read<SettingBloc>().add(SettingEvent.updateGpsTrackingInterval(interval: v));
                                }),
                                isLoading: state.intervalState == RequestStatus.loading,
                              ),
                              context.vWhitespace(10),
                              _chipCard<GpsAccuracy>(
                                icon: Icons.gps_fixed,
                                title: l10n.gpsAccuracyLabel,
                                subtitle: l10n.gpsAccuracyDesc,
                                values: GpsAccuracy.values,
                                selected: accuracy,
                                labelOf: (v) => v.label,
                                onChanged: (v) => setState(() {
                                  context.read<SettingBloc>().add(SettingEvent.updateGpsAccuracy(interval: v));
                                }),
                                isLoading: state.accuracyState == RequestStatus.loading,
                              ),
                              context.vWhitespace(16),
                              _sectionLabel(l10n.behaviourLabel),
                              _toggleCard(
                                icon: Icons.screen_lock_portrait_outlined,
                                title: l10n.keepScreenOnLabel,
                                subtitle: l10n.keepScreenOnDesc,
                                value: state.isKeepScreenOn,
                                isLoading: state.keepScreenOnState == RequestStatus.loading,
                                onChanged: (v) {
                                  context.read<SettingBloc>().add(SettingEvent.updateKeepScreenOn(isKeepScreenOn: v));
                                },
                              ),
                              context.vWhitespace(16),
                              _sectionLabel(l10n.aboutLabel),
                              _infoCard(icon: Icons.info_outline, title: l10n.appVersionLabel, trailing: _appVersion),
                              context.vWhitespace(10),
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
              context.l10n.settingLabel,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
          context.hWhitespace(16),
        ],
      ),
    );
  }

  Widget _sectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.2),
      ),
    );
  }

  Widget _chipCard<T>({
    required IconData icon,
    required String title,
    required String subtitle,
    required List<T> values,
    required T selected,
    required String Function(T) labelOf,
    required ValueChanged<T> onChanged,
    bool isLoading = false,
  }) {
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
          isLoading
              ? _chipShimmer()
              : Wrap(
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
                ),
        ],
      ),
    );
  }

  Widget _chipShimmer() {
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

  Widget _toggleCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isLoading = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: isLoading
          ? _toggleShimmer()
          : Row(
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
            ),
    );
  }

  Widget _toggleShimmer() {
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

  Widget _infoCard({required IconData icon, required String title, required String trailing}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Icon(icon, color: ColorName.primary, size: 18),
          context.hWhitespace(10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: ColorName.darkBlue, fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          Text(trailing, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

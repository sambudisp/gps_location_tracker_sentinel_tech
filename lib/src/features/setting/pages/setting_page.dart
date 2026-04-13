import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/setting/managers/bloc.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/setting/pages/widgets/widgets.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
                    CustomAppBar(title: l10n.settingLabel),
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
                              SectionLabel(label: l10n.trackingLabel),
                              ChipCard<GpsTrackingInterval>(
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
                              ChipCard<GpsAccuracy>(
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
                              SectionLabel(label: l10n.behaviourLabel),
                              ToggleCard(
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
                              SectionLabel(label: l10n.aboutLabel),
                              InfoCard(icon: Icons.info_outline, title: l10n.appVersionLabel, trailing: _appVersion),
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
}

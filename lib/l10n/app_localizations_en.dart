// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Location Tracker - Sentinel Tech';

  @override
  String get appNameTitle => 'Location Tracker';

  @override
  String get sentinelTech => 'Sentinel Tech';

  @override
  String get loadingLabel => 'Loading';

  @override
  String get cancelLabel => 'Cancel';

  @override
  String get yesLabel => 'Yes';

  @override
  String get okLabel => 'OK';

  @override
  String get trackNowLabel => 'Track Now';

  @override
  String get locationHistoryLabel => 'Location History';

  @override
  String get locationTrackingActiveLabel => 'Tracking your location';

  @override
  String get locationTrackingInstructionLabel =>
      'Tap \'Track Now\' to start tracking';

  @override
  String get locationTrackingStopConfirmation => 'Stop tracking your location?';

  @override
  String get locationTrackingSavedMessage => 'Location saved!';

  @override
  String get durationLabel => 'Duration';

  @override
  String get sessionLabel => 'Session';

  @override
  String get deleteAllLabel => 'Delete All';

  @override
  String get emptyStateTitle => 'No history yet';

  @override
  String get emptyStateBody =>
      'Start tracking to see your\nlocation sessions here.';

  @override
  String get settingLabel => 'Setting';
}

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
  String get stopTrackLabel => 'Stop Track';

  @override
  String get locationHistoryLabel => 'Location History';

  @override
  String get locationTrackingActiveLabel => 'Tracking your location...';

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

  @override
  String get accuracyLabel => 'Accuracy';

  @override
  String trackedLocTitle(Object id) {
    return 'Tracked Loc $id';
  }

  @override
  String get startLabel => 'Start';

  @override
  String get endLabel => 'End';

  @override
  String get ongoingLabel => 'Ongoing';

  @override
  String get todayLabel => 'Today';

  @override
  String get yesterdayLabel => 'Yesterday';

  @override
  String get deleteTrackedLocationConfirmationTitle =>
      'Are you sure want to delete?';

  @override
  String deleteTrackedLocationConfirmationBody(Object id) {
    return '\"Tracked Loc. \$$id\" will be permanently deleted.';
  }

  @override
  String get deleteAllDataConfirmationTitle =>
      'Are you sure want to delete all data?';

  @override
  String get deleteAllDataConfirmationBody =>
      'All location history will be permanently deleted. This action cannot be undone.';

  @override
  String get gpsAccuracyLabel => 'GPS accuracy';

  @override
  String get gpsAccuracyDesc => 'Higher accuracy uses more battery';

  @override
  String get keepScreenOnLabel => 'Keep screen on';

  @override
  String get keepScreenOnDesc =>
      'Prevent screen from turning off while tracking';

  @override
  String get aboutLabel => 'About';

  @override
  String get appVersionLabel => 'App version';

  @override
  String get intervalLabel => 'Interval';

  @override
  String get intervalDesc => 'How often location is recorded';

  @override
  String get behaviourLabel => 'Behaviour';

  @override
  String get trackingLabel => 'Tracking';

  @override
  String get gpsNotActiveTitle => 'GPS Not Active';

  @override
  String get permissionIssueTitle => 'Permission Issue';

  @override
  String get gpsNotActiveDesc =>
      'Please enable GPS/Location Service on your device to continue.';

  @override
  String get permissionDeniedForeverDesc =>
      'Location permission permanently denied. Open Settings to enable it.';

  @override
  String get permissionDeniedDesc =>
      'This app needs location permission to work properly.';

  @override
  String get notificationPermissionDeniedDesc =>
      'Notification permission is required to track location in the background. Please enable it in Settings.';

  @override
  String get settingTrackingWarningDesc =>
      '*When tracking is running, any changes to Settings will be applied on the next tracking session.';
}

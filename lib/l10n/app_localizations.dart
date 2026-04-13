import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Location Tracker - Sentinel Tech'**
  String get appName;

  /// No description provided for @appNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Location Tracker'**
  String get appNameTitle;

  /// No description provided for @sentinelTech.
  ///
  /// In en, this message translates to:
  /// **'Sentinel Tech'**
  String get sentinelTech;

  /// No description provided for @loadingLabel.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loadingLabel;

  /// No description provided for @cancelLabel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelLabel;

  /// No description provided for @yesLabel.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yesLabel;

  /// No description provided for @okLabel.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okLabel;

  /// No description provided for @trackNowLabel.
  ///
  /// In en, this message translates to:
  /// **'Track Now'**
  String get trackNowLabel;

  /// No description provided for @stopTrackLabel.
  ///
  /// In en, this message translates to:
  /// **'Stop Track'**
  String get stopTrackLabel;

  /// No description provided for @locationHistoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Location History'**
  String get locationHistoryLabel;

  /// No description provided for @locationTrackingActiveLabel.
  ///
  /// In en, this message translates to:
  /// **'Tracking your location...'**
  String get locationTrackingActiveLabel;

  /// No description provided for @locationTrackingInstructionLabel.
  ///
  /// In en, this message translates to:
  /// **'Tap \'Track Now\' to start tracking'**
  String get locationTrackingInstructionLabel;

  /// No description provided for @locationTrackingStopConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Stop tracking your location?'**
  String get locationTrackingStopConfirmation;

  /// No description provided for @locationTrackingSavedMessage.
  ///
  /// In en, this message translates to:
  /// **'Location saved!'**
  String get locationTrackingSavedMessage;

  /// No description provided for @durationLabel.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get durationLabel;

  /// No description provided for @sessionLabel.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get sessionLabel;

  /// No description provided for @deleteAllLabel.
  ///
  /// In en, this message translates to:
  /// **'Delete All'**
  String get deleteAllLabel;

  /// No description provided for @emptyStateTitle.
  ///
  /// In en, this message translates to:
  /// **'No history yet'**
  String get emptyStateTitle;

  /// No description provided for @emptyStateBody.
  ///
  /// In en, this message translates to:
  /// **'Start tracking to see your\nlocation sessions here.'**
  String get emptyStateBody;

  /// No description provided for @settingLabel.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get settingLabel;

  /// No description provided for @accuracyLabel.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracyLabel;

  /// No description provided for @trackedLocTitle.
  ///
  /// In en, this message translates to:
  /// **'Tracked Loc {id}'**
  String trackedLocTitle(Object id);

  /// No description provided for @startLabel.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startLabel;

  /// No description provided for @endLabel.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get endLabel;

  /// No description provided for @ongoingLabel.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get ongoingLabel;

  /// No description provided for @todayLabel.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayLabel;

  /// No description provided for @yesterdayLabel.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterdayLabel;

  /// No description provided for @deleteTrackedLocationConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to delete?'**
  String get deleteTrackedLocationConfirmationTitle;

  /// No description provided for @deleteTrackedLocationConfirmationBody.
  ///
  /// In en, this message translates to:
  /// **'\"Tracked Loc. {id}\" will be permanently deleted.'**
  String deleteTrackedLocationConfirmationBody(Object id);

  /// No description provided for @deleteAllDataConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to delete all data?'**
  String get deleteAllDataConfirmationTitle;

  /// No description provided for @deleteAllDataConfirmationBody.
  ///
  /// In en, this message translates to:
  /// **'All completed location history will be permanently deleted and cannot be undone. Ongoing tracking will remain.'**
  String get deleteAllDataConfirmationBody;

  /// No description provided for @gpsAccuracyLabel.
  ///
  /// In en, this message translates to:
  /// **'GPS accuracy'**
  String get gpsAccuracyLabel;

  /// No description provided for @gpsAccuracyDesc.
  ///
  /// In en, this message translates to:
  /// **'Higher accuracy uses more battery'**
  String get gpsAccuracyDesc;

  /// No description provided for @keepScreenOnLabel.
  ///
  /// In en, this message translates to:
  /// **'Keep screen on'**
  String get keepScreenOnLabel;

  /// No description provided for @keepScreenOnDesc.
  ///
  /// In en, this message translates to:
  /// **'Prevent screen from turning off while tracking'**
  String get keepScreenOnDesc;

  /// No description provided for @aboutLabel.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutLabel;

  /// No description provided for @appVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'App version'**
  String get appVersionLabel;

  /// No description provided for @intervalLabel.
  ///
  /// In en, this message translates to:
  /// **'Interval'**
  String get intervalLabel;

  /// No description provided for @intervalDesc.
  ///
  /// In en, this message translates to:
  /// **'How often location is recorded'**
  String get intervalDesc;

  /// No description provided for @behaviourLabel.
  ///
  /// In en, this message translates to:
  /// **'Behaviour'**
  String get behaviourLabel;

  /// No description provided for @trackingLabel.
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get trackingLabel;

  /// No description provided for @gpsNotActiveTitle.
  ///
  /// In en, this message translates to:
  /// **'GPS Not Active'**
  String get gpsNotActiveTitle;

  /// No description provided for @permissionIssueTitle.
  ///
  /// In en, this message translates to:
  /// **'Permission Issue'**
  String get permissionIssueTitle;

  /// No description provided for @gpsNotActiveDesc.
  ///
  /// In en, this message translates to:
  /// **'Please enable GPS/Location Service on your device to continue.'**
  String get gpsNotActiveDesc;

  /// No description provided for @permissionDeniedForeverDesc.
  ///
  /// In en, this message translates to:
  /// **'Location permission permanently denied. Open Settings to enable it.'**
  String get permissionDeniedForeverDesc;

  /// No description provided for @permissionDeniedDesc.
  ///
  /// In en, this message translates to:
  /// **'This app needs location permission to work properly.'**
  String get permissionDeniedDesc;

  /// No description provided for @notificationPermissionDeniedDesc.
  ///
  /// In en, this message translates to:
  /// **'Notification permission is required to track location in the background. Please enable it in Settings.'**
  String get notificationPermissionDeniedDesc;

  /// No description provided for @settingTrackingWarningDesc.
  ///
  /// In en, this message translates to:
  /// **'*When tracking is running, any changes to Settings will be applied on the next tracking session.'**
  String get settingTrackingWarningDesc;

  /// No description provided for @dataDeletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Data deleted'**
  String get dataDeletedMessage;

  /// No description provided for @recordsLabel.
  ///
  /// In en, this message translates to:
  /// **'Records'**
  String get recordsLabel;

  /// No description provided for @locationTrackingActiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Location Tracking Active'**
  String get locationTrackingActiveTitle;

  /// No description provided for @saveFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to save location data'**
  String get saveFailedMessage;

  /// No description provided for @deleteFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete data'**
  String get deleteFailedMessage;

  /// No description provided for @getDataFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to load data'**
  String get getDataFailedMessage;

  /// No description provided for @saveSettingIntervalFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to save GPS Tracking Interval setting'**
  String get saveSettingIntervalFailedMessage;

  /// No description provided for @saveSettingAccuracyFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to save GPS Accuracy setting'**
  String get saveSettingAccuracyFailedMessage;

  /// No description provided for @saveSettingKeepScreenOnFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to save Keep Screen On setting'**
  String get saveSettingKeepScreenOnFailedMessage;

  /// No description provided for @generalError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get generalError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

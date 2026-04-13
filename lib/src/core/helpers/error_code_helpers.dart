import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/enums/error_codes.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/utils/shared_value.dart';

extension ErrorCodeHelpers on ErrorCodes {
  String toMessage(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      // Database errors
      case ErrorCodes.insertLocationTrackingFailed:
      case ErrorCodes.updateTrackedLocationFailed:
        return l10n.saveFailedMessage;
      case ErrorCodes.deleteTrackedLocationFailed:
        return l10n.deleteFailedMessage;
      case ErrorCodes.getTrackedLocationDataFailed:
        return l10n.getDataFailedMessage;

      // Setting errors
      case ErrorCodes.updateSettingIntervalFailed:
        return l10n.saveSettingIntervalFailedMessage;
      case ErrorCodes.getSettingIntervalFailed:
      case ErrorCodes.getSettingKeepScreenOnFailed:
      case ErrorCodes.getSettingAccuracyFailed:
        return l10n.getDataFailedMessage;
      case ErrorCodes.updateSettingAccuracyFailed:
        return l10n.saveSettingAccuracyFailedMessage;
      case ErrorCodes.updateSettingKeepScreenOnFailed:
        return l10n.saveSettingKeepScreenOnFailedMessage;
      case ErrorCodes.generalError:
        return l10n.generalError;
    }
  }
}

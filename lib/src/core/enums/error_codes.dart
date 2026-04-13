enum ErrorCodes {
  // General errors
  generalError,

  // Database errors
  insertLocationTrackingFailed,
  updateTrackedLocationFailed,
  deleteTrackedLocationFailed,
  getTrackedLocationDataFailed,

  // Setting errors
  updateSettingIntervalFailed,
  getSettingIntervalFailed,
  updateSettingAccuracyFailed,
  getSettingAccuracyFailed,
  updateSettingKeepScreenOnFailed,
  getSettingKeepScreenOnFailed,
}

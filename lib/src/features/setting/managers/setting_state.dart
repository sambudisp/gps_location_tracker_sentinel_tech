part of 'setting_bloc.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState({
    @Default(RequestStatus.idle) RequestStatus intervalState,
    @Default(RequestStatus.idle) RequestStatus accuracyState,
    @Default(RequestStatus.idle) RequestStatus keepScreenOnState,
    ErrorCodes? errorCode,
    GpsTrackingInterval? interval,
    GpsAccuracy? accuracy,
    @Default(false) bool isKeepScreenOn,
  }) = _Initial;
}

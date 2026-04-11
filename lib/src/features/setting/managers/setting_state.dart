part of 'setting_bloc.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState({
    @Default(DbStatus.idle) DbStatus intervalState,
    @Default(DbStatus.idle) DbStatus accuracyState,
    @Default(DbStatus.idle) DbStatus keepScreenOnState,
    @Default('') String errorMessage,
    GpsTrackingInterval? interval,
    GpsAccuracy? accuracy,
    @Default(false) bool isKeepScreenOn,
  }) = _Initial;
}

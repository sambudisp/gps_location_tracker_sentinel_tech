part of 'setting_bloc.dart';

@freezed
abstract class SettingEvent with _$SettingEvent {
  const factory SettingEvent.updateGpsTrackingInterval({required GpsTrackingInterval interval}) =
      _UpdateGpsTrackingInterval;
  const factory SettingEvent.getGpsTrackingInterval() = _GetGpsTrackingInterval;

  const factory SettingEvent.updateGpsAccuracy({required GpsAccuracy interval}) = _UpdateGpsAccuracy;
  const factory SettingEvent.getGpsAccuracy() = _GetGpsAccuracy;

  const factory SettingEvent.updateKeepScreenOn({required bool isKeepScreenOn}) = _UpdateKeepScreenOn;
  const factory SettingEvent.isKeepScreenOn() = _IsKeepScreenOn;
}

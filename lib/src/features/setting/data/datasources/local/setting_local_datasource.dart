import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';

enum GpsTrackingInterval {
  s5(5),
  s10(10),
  s30(30),
  m1(60);

  const GpsTrackingInterval(this.key);

  final int key;

  static GpsTrackingInterval? tryGetBy(int value) {
    try {
      return GpsTrackingInterval.values.firstWhere((element) => element.key == value);
    } catch (_) {
      return null;
    }
  }
}

enum GpsAccuracy { lowest, low, medium, high, best }

extension GpsAccuracyX on String {
  GpsAccuracy toGpsAccuracy() {
    return GpsAccuracy.values.firstWhere((e) => e.name == this, orElse: () => GpsAccuracy.high);
  }
}

extension GpsAccuracyY on double {
  LocationAccuracy toAccuracyLevel() {
    if (this <= 5) return LocationAccuracy.best;
    if (this <= 10) return LocationAccuracy.high;
    if (this <= 25) return LocationAccuracy.medium;
    if (this <= 50) return LocationAccuracy.low;
    return LocationAccuracy.lowest;
  }
}

extension GpsAccuracyToLocationAccuracy on GpsAccuracy {
  LocationAccuracy toLocationAccuracy() {
    switch (this) {
      case GpsAccuracy.best:
        return LocationAccuracy.best;
      case GpsAccuracy.high:
        return LocationAccuracy.high;
      case GpsAccuracy.medium:
        return LocationAccuracy.medium;
      case GpsAccuracy.low:
        return LocationAccuracy.low;
      case GpsAccuracy.lowest:
        return LocationAccuracy.lowest;
    }
  }
}

class SettingLocalDatasource {
  static const _gpsTrackingInterval = 'gps-tracking-interval';
  static const _gpsAccuracy = 'gps-accuracy';
  static const _keepScreenOn = 'keep-screen-on';

  SettingLocalDatasource({FlutterSecureStorage? secureStorage})
    : _secureStorage =
          secureStorage ?? const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
  final FlutterSecureStorage _secureStorage;

  Future<void> updateGpsTrackingInterval({required GpsTrackingInterval interval}) {
    return _secureStorage.write(key: _gpsTrackingInterval, value: interval.key.toString());
  }

  // Setting : GPS Interval
  Future<GpsTrackingInterval?> getGpsTrackingInterval() async {
    final value = await _secureStorage.read(key: _gpsTrackingInterval);

    if (value == null) return null;

    final intValue = int.tryParse(value);
    if (intValue == null) return null;

    return GpsTrackingInterval.tryGetBy(intValue);
  }

  // Setting : GPS Accuracy
  Future<void> updateGpsAccuracy({required GpsAccuracy accuracy}) {
    return _secureStorage.write(key: _gpsAccuracy, value: accuracy.name);
  }

  Future<GpsAccuracy?> getGpsAccuracy() async {
    final value = await _secureStorage.read(key: _gpsAccuracy);

    if (value == null) return null;

    try {
      return GpsAccuracy.values.byName(value);
    } catch (_) {
      return null;
    }
  }

  // Setting : Keep Screen On
  Future<void> updateKeepScreenOn({required bool isKeepScreenOn}) {
    return _secureStorage.write(key: _keepScreenOn, value: isKeepScreenOn.toString());
  }

  Future<bool?> isKeepScreenOn() async {
    final value = await _secureStorage.read(key: _keepScreenOn);

    if (value == null) return null;

    return value == 'true';
  }
}

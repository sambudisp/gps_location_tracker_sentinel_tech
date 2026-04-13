import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/core/core.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/setting/core/core.dart';

import '../../../../core/core.dart';
import '../../../setting/data/data.dart';
import '../../../setting/domain/domain.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';

@pragma('vm:entry-point')
void startCallback() {
  FlutterForegroundTask.setTaskHandler(LocationForegroundTask());
}

class LocationForegroundTask extends TaskHandler {
  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    // init dependencies karena isolate baru
    if (!locator.isRegistered<LocationTrackerRepository>()) {
      LocationTrackerDependency.init();
      SettingDependency.init();
    }
  }

  @override
  Future<void> onRepeatEvent(DateTime timestamp) async {
    try {
      final parentId = await FlutterForegroundTask.getData<int>(key: 'parentId');
      if (parentId == null) return;

      final accuracySetting = await locator<SettingRepository>().getGpsAccuracy();
      final accuracyString = accuracySetting.fold(
        (_) => GpsAccuracy.high.name,
        (value) => value?.name ?? GpsAccuracy.high.name,
      );

      final position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: accuracyString.toGpsAccuracy().toLocationAccuracy()),
      );

      final data = TrackedLocationDataDetailModel(
        parentId: parentId,
        latitude: position.latitude,
        longitude: position.longitude,
        timestamp: DateTime.now().toIso8601String(),
        accuracy: position.accuracy.toAccuracyLevel().name,
      );

      await locator<LocationTrackerRepository>().inputTrackedLocationDataDetail(data);
    } catch (e) {
      debugPrint('LocationForegroundTask error: $e');
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp) async {
    debugPrint('LocationForegroundTask destroyed');
  }
}

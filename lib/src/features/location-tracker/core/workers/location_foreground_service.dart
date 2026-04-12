import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import '../../../setting/data/data.dart';
import 'location_foreground_task.dart';

class LocationForegroundService {
  const LocationForegroundService._();

  static void init({required GpsTrackingInterval interval}) {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'location_tracking',
        channelName: 'Location Tracking',
        channelDescription: 'Tracking your location in background',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
      ),
      iosNotificationOptions: const IOSNotificationOptions(showNotification: true, playSound: false),
      foregroundTaskOptions: ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.repeat(interval.toIntervalDuration().inMilliseconds),
        autoRunOnBoot: true,
        allowWifiLock: true,
      ),
    );
  }

  static Future<void> start({required int parentId, required GpsTrackingInterval interval}) async {
    init(interval: interval);

    await FlutterForegroundTask.saveData(key: 'parentId', value: parentId);

    if (await FlutterForegroundTask.isRunningService) {
      await FlutterForegroundTask.restartService();
    } else {
      await FlutterForegroundTask.startService(
        serviceId: 1000,
        notificationTitle: 'Location Tracking Active',
        notificationText: 'Tracking your location...',
        callback: startCallback,
      );
    }
  }

  static Future<void> stop() async {
    await FlutterForegroundTask.stopService();
  }
}

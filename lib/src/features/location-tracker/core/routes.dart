import 'package:go_router/go_router.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/data/data.dart';

import '../pages/pages.dart';

class LocationTrackerRouter {
  const LocationTrackerRouter._();

  static final List<GoRoute> init = [
    GoRoute(
      name: locationTracker,
      path: locationTrackerPath,
      builder: (context, state) {
        return const LocationTrackerPage();
      },
      routes: [],
    ),
    GoRoute(
      name: locationHistory,
      path: locationHistoryPath,
      builder: (context, state) {
        return const LocationHistoryPage();
      },
      routes: [
        GoRoute(
          name: locationHistoryDetail,
          path: locationHistoryDetailPath,
          builder: (context, state) {
            final data = state.extra as TrackedLocationDataModel;
            return LocationHistoryDetailPage(trackedLocationData: data);
          },
        ),
      ],
    ),
  ];

  static const String locationTracker = 'locationTracker';
  static const String locationTrackerPath = '/locationTracker';
  static const String locationHistory = 'locationHistory';
  static const String locationHistoryPath = '/locationHistory';
  static const String locationHistoryDetail = 'locationHistoryDetail';
  static const String locationHistoryDetailPath = '/locationHistoryDetail';
}

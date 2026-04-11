import 'core.dart';

class LocationTracker {
  const LocationTracker._();

  static void injection() => LocationTrackerDependency.init();
  static final blocProviders = LocationTrackerProvider.blocProviders;
  static final routes = LocationTrackerRouter.init;
}

import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/data/repositories/location_tracker_repository_impl.dart';

import '../../../core/db/db_sqflite_helper.dart';
import '../../../core/injection/injector.dart';
import '../domain/repositories/location_tracker_repository.dart';
import '../managers/location_tracker_bloc.dart';

class LocationTrackerDependency {
  const LocationTrackerDependency._();

  static void init() {
    /// [STATE_MANAGEMENT]
    locator.registerLazySingleton(() => LocationTrackerBloc(locator(), locator()));

    /// [REPOSITORY]
    locator.registerLazySingleton<LocationTrackerRepository>(() => LocationTrackerRepositoryImpl());

    /// [DATABASE_HELPER]
    locator.registerLazySingleton<DbSqfliteHelper>(() => DbSqfliteHelper());
  }
}

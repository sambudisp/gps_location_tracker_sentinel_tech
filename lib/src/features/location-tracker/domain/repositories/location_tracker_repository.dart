import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';

abstract class LocationTrackerRepository {
  Future<Either<Failure, TrackedLocationDataModel>> inputTrackedLocationData(TrackedLocationDataModel data);
  Future<Either<Failure, void>> updateTrackedLocationData({
    required int id,
    required String stoppedTime,
    required int duration,
  });

  Future<Either<Failure, void>> inputTrackedLocationDataDetail(TrackedLocationDataDetailModel data);
}

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
  Future<Either<Failure, List<TrackedLocationDataModel>>> getTrackedLocationHistory();
  Future<Either<Failure, List<TrackedLocationDataDetailModel>>> getTrackedLocationHistoryDetail({
    required int? parentId,
  });
  Future<Either<Failure, bool>> deleteTrackedLocationHistory({required int? id});
  Future<Either<Failure, bool>> deleteAllTrackedLocationHistory();
  Future<Either<Failure, TrackedLocationDataModel?>> getActiveTracking();
}

import 'package:fpdart/src/either.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/data/models/tracked_location_data_detail_model.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/data/models/tracked_location_data_model.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../datasources/datasources.dart';

class LocationTrackerRepositoryImpl implements LocationTrackerRepository {
  final LocationTrackerLocalDatasource _datasources;

  LocationTrackerRepositoryImpl(this._datasources);

  @override
  Future<Either<Failure, TrackedLocationDataModel>> inputTrackedLocationData(TrackedLocationDataModel data) async {
    final result = await _datasources.insertTrackedLocationData(data);
    return result != null
        ? Either.right(result)
        : Either.left(DatabaseFailure(ErrorCodes.insertLocationTrackingFailed));
  }

  @override
  Future<Either<Failure, int>> updateTrackedLocationData({
    required int id,
    required String stoppedTime,
    required int duration,
  }) async {
    int result = await _datasources.updateTrackedLocationData(id: id, stoppedTime: stoppedTime, duration: duration);
    return (result != -1) ? Either.right(result) : Either.left(DatabaseFailure(ErrorCodes.updateTrackedLocationFailed));
  }

  @override
  Future<Either<Failure, void>> inputTrackedLocationDataDetail(TrackedLocationDataDetailModel data) async {
    int result = await _datasources.insertTrackedLocationDataDetail(data);
    return (result != -1)
        ? Either.right(result)
        : Either.left(DatabaseFailure(ErrorCodes.insertLocationTrackingFailed));
  }

  @override
  Future<Either<Failure, List<TrackedLocationDataModel>>> getTrackedLocationHistory() async {
    List<TrackedLocationDataModel> result = await _datasources.getTrackedLocationHistory();
    return (result.isNotEmpty)
        ? Either.right(result)
        : Either.left(DatabaseFailure(ErrorCodes.getTrackedLocationDataFailed));
  }

  @override
  Future<Either<Failure, List<TrackedLocationDataDetailModel>>> getTrackedLocationHistoryDetail({
    required int? parentId,
  }) async {
    List<TrackedLocationDataDetailModel> result = await _datasources.getTrackedLocationHistoryDetail(
      parentId: parentId,
    );
    return (result.isNotEmpty)
        ? Either.right(result)
        : Either.left(DatabaseFailure(ErrorCodes.getTrackedLocationDataFailed));
  }

  @override
  Future<Either<Failure, bool>> deleteTrackedLocationHistory({required int? id}) async {
    bool result = await _datasources.deleteTrackedLocationHistory(id: id);
    return result ? Either.right(true) : Either.left(DatabaseFailure(ErrorCodes.deleteTrackedLocationFailed));
  }

  @override
  Future<Either<Failure, bool>> deleteAllTrackedLocationHistory() async {
    bool result = await _datasources.deleteAllTrackedLocationHistory();
    return result ? Either.right(true) : Either.left(DatabaseFailure(ErrorCodes.deleteTrackedLocationFailed));
  }

  @override
  Future<Either<Failure, TrackedLocationDataModel?>> getActiveTracking() async {
    try {
      final result = await _datasources.getActiveTracking();
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(ErrorCodes.getSettingAccuracyFailed));
    }
  }
}

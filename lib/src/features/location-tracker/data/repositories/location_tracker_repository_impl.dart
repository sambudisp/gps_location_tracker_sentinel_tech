import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/data/models/tracked_location_data_detail_model.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/data/models/tracked_location_data_model.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../datasources/datasources.dart';

class LocationTrackerRepositoryImpl implements LocationTrackerRepository {
  final LocationTrackerLocalDatasource _datasources;

  LocationTrackerRepositoryImpl({@visibleForTesting LocationTrackerLocalDatasource? datasources})
    : _datasources = datasources ?? LocationTrackerLocalDatasource(DbSqfliteHelper());

  @override
  Future<Either<Failure, TrackedLocationDataModel>> inputTrackedLocationData(TrackedLocationDataModel data) async {
    final result = await _datasources.insertTrackedLocationData(data);
    return result != null ? Either.right(result) : Either.left(DatabaseFailure('Error Insert Aja'));
  }

  @override
  Future<Either<Failure, int>> updateTrackedLocationData({
    required int id,
    required String stoppedTime,
    required int duration,
  }) async {
    int result = await _datasources.updateTrackedLocationData(id: id, stoppedTime: stoppedTime, duration: duration);
    return (result != -1) ? Either.right(result) : Either.left(DatabaseFailure('Error Update Aja'));
  }

  @override
  Future<Either<Failure, void>> inputTrackedLocationDataDetail(TrackedLocationDataDetailModel data) async {
    int result = await _datasources.insertTrackedLocationDataDetail(data);
    return (result != -1) ? Either.right(result) : Either.left(DatabaseFailure('Error Insert'));
  }
}

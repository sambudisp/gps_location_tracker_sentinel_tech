import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../datasources/datasources.dart';

class SettingRepositoryImpl implements SettingRepository {
  final SettingLocalDatasource _datasources;

  SettingRepositoryImpl({@visibleForTesting SettingLocalDatasource? datasources})
    : _datasources = datasources ?? SettingLocalDatasource();

  @override
  Future<Either<Failure, void>> updateGpsTrackingInterval({required GpsTrackingInterval interval}) async {
    try {
      await _datasources.updateGpsTrackingInterval(interval: interval);
      return const Right(null);
    } catch (e) {
      return Left(SharedPreferenceFailure(ErrorCodes.updateSettingIntervalFailed));
    }
  }

  @override
  Future<Either<Failure, GpsTrackingInterval?>> getGpsTrackingInterval() async {
    try {
      final result = await _datasources.getGpsTrackingInterval();
      return Right(result);
    } catch (e) {
      return Left(SharedPreferenceFailure(ErrorCodes.getSettingIntervalFailed));
    }
  }

  @override
  Future<Either<Failure, void>> updateGpsAccuracy({required GpsAccuracy accuracy}) async {
    try {
      await _datasources.updateGpsAccuracy(accuracy: accuracy);
      return const Right(null);
    } catch (e) {
      return Left(SharedPreferenceFailure(ErrorCodes.updateSettingAccuracyFailed));
    }
  }

  @override
  Future<Either<Failure, GpsAccuracy?>> getGpsAccuracy() async {
    try {
      final result = await _datasources.getGpsAccuracy();
      return Right(result);
    } catch (e) {
      return Left(SharedPreferenceFailure(ErrorCodes.getSettingAccuracyFailed));
    }
  }

  @override
  Future<Either<Failure, void>> updateKeepScreenOn({required bool isKeepScreenOn}) async {
    try {
      await _datasources.updateKeepScreenOn(isKeepScreenOn: isKeepScreenOn);
      return const Right(null);
    } catch (e) {
      return Left(SharedPreferenceFailure(ErrorCodes.updateSettingKeepScreenOnFailed));
    }
  }

  @override
  Future<Either<Failure, bool>> isKeepScreenOn() async {
    try {
      final result = await _datasources.isKeepScreenOn();
      return Right(result ?? false);
    } catch (e) {
      return Left(SharedPreferenceFailure(ErrorCodes.getSettingKeepScreenOnFailed));
    }
  }
}

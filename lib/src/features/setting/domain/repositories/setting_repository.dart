import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';

abstract class SettingRepository {
  Future<Either<Failure, void>> updateGpsTrackingInterval({required GpsTrackingInterval interval});

  Future<Either<Failure, GpsTrackingInterval?>> getGpsTrackingInterval();

  Future<Either<Failure, void>> updateGpsAccuracy({required GpsAccuracy accuracy});

  Future<Either<Failure, GpsAccuracy?>> getGpsAccuracy();

  Future<Either<Failure, void>> updateKeepScreenOn({required bool isKeepScreenOn});

  Future<Either<Failure, bool>> isKeepScreenOn();
}

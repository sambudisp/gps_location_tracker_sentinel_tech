import 'package:equatable/equatable.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/enums/error_codes.dart';

abstract class Failure extends Equatable {
  final ErrorCodes errorCode;

  const Failure(this.errorCode);

  @override
  List<Object> get props => [errorCode];
}

class DatabaseFailure extends Failure {
  const DatabaseFailure([ErrorCodes? message]) : super(message ?? ErrorCodes.generalError);
}

class SharedPreferenceFailure extends Failure {
  const SharedPreferenceFailure([ErrorCodes? message]) : super(message ?? ErrorCodes.generalError);
}

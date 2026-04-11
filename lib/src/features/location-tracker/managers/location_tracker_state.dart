part of 'location_tracker_bloc.dart';

@freezed
abstract class LocationTrackerState with _$LocationTrackerState {
  const factory LocationTrackerState({
    @Default(DbStatus.idle) DbStatus stateLocationTracking,
    @Default(DbStatus.idle) DbStatus stateLocationTrackingByInterval,
    @Default('') String errorMessage,
    @Default(0) int? activeTrackingId,
    @Default('') String? activeTrackingStartedTime,
  }) = _Initial;
}

part of 'location_tracker_bloc.dart';

@freezed
abstract class LocationTrackerState with _$LocationTrackerState {
  const factory LocationTrackerState({
    @Default(RequestStatus.idle) RequestStatus stateLocationTracking,
    @Default(RequestStatus.idle) RequestStatus stateTrackedLocationHistory,
    @Default(RequestStatus.idle) RequestStatus stateTrackedLocationHistoryDetail,
    @Default(RequestStatus.idle) RequestStatus stateDeleteTrackedLocationHistory,
    ErrorCodes? errorCode,
    @Default(0) int? activeTrackingId,
    @Default('') String? activeTrackingStartedTime,
    @Default([]) List<TrackedLocationDataModel> trackedLocationHistory,
    @Default([]) List<TrackedLocationDataDetailModel> trackedLocationHistoryDetail,
    @Default('') String locationTrackingActiveTitle,
    @Default('') String locationTrackingActiveLabel,
  }) = _Initial;
}

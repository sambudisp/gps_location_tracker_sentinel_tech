part of 'location_tracker_bloc.dart';

@freezed
abstract class LocationTrackerEvent with _$LocationTrackerEvent {
  const factory LocationTrackerEvent.startLocationTracking() = _StartLocationTracking;

  const factory LocationTrackerEvent.stopLocationTracking() = _StopLocationTracking;

  const factory LocationTrackerEvent.getTrackedLocationHistory() = _GetTrackedLocationHistory;

  const factory LocationTrackerEvent.getTrackedLocationHistoryDetail({required int? parentId}) =
      _GetTrackedLocationHistoryDetail;

  const factory LocationTrackerEvent.deleteTrackedLocationHistory({required int? id}) = _DeleteTrackedLocationHistory;

  const factory LocationTrackerEvent.deleteAllTrackedLocationHistory() = _DeleteAllTrackedLocationHistory;

  const factory LocationTrackerEvent.restoreLocationTracking() = _RestoreLocationTracking;

  const factory LocationTrackerEvent.setLocationTrackingNotificationCopy({
    required String locationTrackingActiveTitle,
    required String locationTrackingActiveLabel,
  }) = _SetLocationTrackingNotificationCopy;
}

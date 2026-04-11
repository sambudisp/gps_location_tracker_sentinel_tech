part of 'location_tracker_bloc.dart';

@freezed
abstract class LocationTrackerEvent with _$LocationTrackerEvent {
  const factory LocationTrackerEvent.startLocationTracking() = _StartLocationTracking;

  const factory LocationTrackerEvent.stopLocationTracking() = _StopLocationTracking;

  const factory LocationTrackerEvent.startLocationTrackingByInterval() = _StartLocationTrackingByInterval;
}

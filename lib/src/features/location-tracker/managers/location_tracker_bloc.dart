import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/setting/data/data.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/setting/domain/domain.dart';

import '../../../core/core.dart';
import '../data/data.dart';
import '../domain/repositories/location_tracker_repository.dart';

part 'location_tracker_bloc.freezed.dart';
part 'location_tracker_event.dart';
part 'location_tracker_state.dart';

class LocationTrackerBloc extends Bloc<LocationTrackerEvent, LocationTrackerState> {
  final LocationTrackerRepository locationTrackerRepository;
  final SettingRepository settingRepository;
  Timer? _intervalTimer;

  LocationTrackerBloc(@visibleForTesting this.locationTrackerRepository, this.settingRepository)
    : super(const _Initial()) {
    on<_StartLocationTracking>((event, emit) async {
      emit(state.copyWith(stateLocationTracking: DbStatus.loading));
      final startedTime = DateTime.now().toIso8601String();
      final data = TrackedLocationDataModel(startedTime: startedTime);
      final result = await locationTrackerRepository.inputTrackedLocationData(data);
      result.match(
        (err) {
          emit(state.copyWith(stateLocationTracking: DbStatus.error, errorMessage: err.message));
        },
        (data) {
          emit(
            state.copyWith(
              stateLocationTracking: DbStatus.success,
              activeTrackingId: data.id,
              activeTrackingStartedTime: data.startedTime,
            ),
          );
          add(const LocationTrackerEvent.startLocationTrackingByInterval());
        },
      );
    });

    on<_StopLocationTracking>((event, emit) async {
      emit(state.copyWith(stateLocationTracking: DbStatus.loading));

      _intervalTimer?.cancel();
      _intervalTimer = null;

      final stoppedTime = DateTime.now().toIso8601String();
      final duration = DateTime.now().difference(DateTime.parse(state.activeTrackingStartedTime!)).inMilliseconds;

      final result = await locationTrackerRepository.updateTrackedLocationData(
        id: state.activeTrackingId ?? 0,
        stoppedTime: stoppedTime,
        duration: duration,
      );

      result.match(
        (err) {
          emit(
            state.copyWith(
              stateLocationTracking: DbStatus.error,
              errorMessage: err.message,
              activeTrackingId: null,
              activeTrackingStartedTime: null,
            ),
          );
        },
        (data) {
          emit(
            state.copyWith(
              stateLocationTracking: DbStatus.success,
              activeTrackingId: null,
              activeTrackingStartedTime: null,
            ),
          );
        },
      );
    });

    on<_StartLocationTrackingByInterval>((event, emit) async {
      _intervalTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
        final accuracySetting = await settingRepository.getGpsAccuracy();
        final accuracyString =
            accuracySetting.fold((failure) => GpsAccuracy.high.name, (value) => value?.name) ?? GpsAccuracy.high.name;
        final position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: accuracyString.toGpsAccuracy().toLocationAccuracy()),
        );

        final data = TrackedLocationDataDetailModel(
          parentId: state.activeTrackingId!,
          latitude: position.latitude,
          longitude: position.longitude,
          timestamp: DateTime.now().toIso8601String(),
          accuracy: position.accuracy.toAccuracyLevel().name,
        );

        await locationTrackerRepository.inputTrackedLocationDataDetail(data);
      });
    });
  }

  @override
  Future<void> close() {
    _intervalTimer?.cancel();
    return super.close();
  }
}

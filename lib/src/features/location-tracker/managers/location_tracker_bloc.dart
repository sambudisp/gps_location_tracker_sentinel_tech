import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/setting/data/data.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/setting/domain/domain.dart';

import '../../../core/core.dart';
import '../core/workers/location_foreground_service.dart';
import '../data/data.dart';
import '../domain/repositories/location_tracker_repository.dart';

part 'location_tracker_bloc.freezed.dart';
part 'location_tracker_event.dart';
part 'location_tracker_state.dart';

class LocationTrackerBloc extends Bloc<LocationTrackerEvent, LocationTrackerState> {
  final LocationTrackerRepository locationTrackerRepository;
  final SettingRepository settingRepository;

  LocationTrackerBloc(@visibleForTesting this.locationTrackerRepository, this.settingRepository)
    : super(const _Initial()) {
    Future<void> insertCurrentLocation({required int parentId}) async {
      try {
        final accuracySetting = await settingRepository.getGpsAccuracy();
        final accuracyString =
            accuracySetting.fold((failure) => GpsAccuracy.high.name, (value) => value?.name) ?? GpsAccuracy.high.name;

        final position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: accuracyString.toGpsAccuracy().toLocationAccuracy()),
        );

        final detail = TrackedLocationDataDetailModel(
          parentId: parentId,
          latitude: position.latitude,
          longitude: position.longitude,
          timestamp: DateTime.now().toIso8601String(),
          accuracy: position.accuracy.toAccuracyLevel().name,
        );

        await locationTrackerRepository.inputTrackedLocationDataDetail(detail);
      } catch (e) {
        //debugPrint('insertCurrentLocation error: $e');
      }
    }

    on<_StartLocationTracking>((event, emit) async {
      emit(state.copyWith(stateLocationTracking: RequestStatus.loading));
      final startedTime = DateTime.now().toIso8601String();
      final data = TrackedLocationDataModel(startedTime: startedTime);
      final result = await locationTrackerRepository.inputTrackedLocationData(data);
      result.match(
        (err) {
          emit(state.copyWith(stateLocationTracking: RequestStatus.error, errorCode: err.errorCode));
        },
        (data) async {
          emit(
            state.copyWith(
              stateLocationTracking: RequestStatus.success,
              activeTrackingId: data.id,
              activeTrackingStartedTime: data.startedTime,
            ),
          );

          // First Insert
          await insertCurrentLocation(parentId: data.id!);

          // Start Tracking By Interval by ForegroundTask
          final intervalSetting = await settingRepository.getGpsTrackingInterval();
          final interval = intervalSetting.fold(
            (_) => GpsTrackingInterval.s10,
            (value) => value ?? GpsTrackingInterval.s10,
          );
          await LocationForegroundService.start(
            parentId: data.id!,
            interval: interval,
            locationTrackingActiveTitle: state.locationTrackingActiveTitle,
            locationTrackingActiveLabel: state.locationTrackingActiveLabel,
          );
        },
      );
    });

    on<_StopLocationTracking>((event, emit) async {
      emit(state.copyWith(stateLocationTracking: RequestStatus.loading));

      await LocationForegroundService.stop();

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
              stateLocationTracking: RequestStatus.error,
              errorCode: err.errorCode,
              activeTrackingId: null,
              activeTrackingStartedTime: null,
            ),
          );
        },
        (_) {
          emit(
            state.copyWith(
              stateLocationTracking: RequestStatus.idle,
              activeTrackingId: null,
              activeTrackingStartedTime: null,
            ),
          );
        },
      );
    });

    on<_GetTrackedLocationHistory>((event, emit) async {
      emit(state.copyWith(stateTrackedLocationHistory: RequestStatus.loading));
      final result = await locationTrackerRepository.getTrackedLocationHistory();
      result.match(
        (err) {
          emit(state.copyWith(stateTrackedLocationHistory: RequestStatus.error, errorCode: err.errorCode));
        },
        (data) {
          emit(state.copyWith(stateTrackedLocationHistory: RequestStatus.success, trackedLocationHistory: data));
        },
      );
    });

    on<_GetTrackedLocationHistoryDetail>((event, emit) async {
      emit(state.copyWith(stateTrackedLocationHistoryDetail: RequestStatus.loading));
      final result = await locationTrackerRepository.getTrackedLocationHistoryDetail(parentId: event.parentId);
      result.match(
        (err) {
          emit(state.copyWith(stateTrackedLocationHistoryDetail: RequestStatus.error, errorCode: err.errorCode));
        },
        (data) {
          emit(
            state.copyWith(
              stateTrackedLocationHistoryDetail: RequestStatus.success,
              trackedLocationHistoryDetail: data,
            ),
          );
        },
      );
    });

    on<_DeleteTrackedLocationHistory>((event, emit) async {
      emit(state.copyWith(stateDeleteTrackedLocationHistory: RequestStatus.loading));
      final result = await locationTrackerRepository.deleteTrackedLocationHistory(id: event.id);
      result.match(
        (err) {
          emit(state.copyWith(stateDeleteTrackedLocationHistory: RequestStatus.error, errorCode: err.errorCode));
        },
        (_) {
          final updatedList = state.trackedLocationHistory.where((e) => e.id != event.id).toList();
          emit(
            state.copyWith(
              stateDeleteTrackedLocationHistory: RequestStatus.success,
              trackedLocationHistory: updatedList,
            ),
          );
        },
      );
    });

    on<_DeleteAllTrackedLocationHistory>((event, emit) async {
      emit(state.copyWith(stateDeleteTrackedLocationHistory: RequestStatus.loading));
      final result = await locationTrackerRepository.deleteAllTrackedLocationHistory();
      result.match(
        (err) {
          emit(state.copyWith(stateDeleteTrackedLocationHistory: RequestStatus.error, errorCode: err.errorCode));
        },
        (_) {
          emit(state.copyWith(stateDeleteTrackedLocationHistory: RequestStatus.success, trackedLocationHistory: []));
          add(const _GetTrackedLocationHistory());
        },
      );
    });

    on<_RestoreLocationTracking>((event, emit) async {
      final result = await locationTrackerRepository.getActiveTracking();
      result.match((_) => null, (data) {
        if (data == null) return;
        emit(
          state.copyWith(
            activeTrackingId: data.id,
            activeTrackingStartedTime: data.startedTime,
            stateLocationTracking: RequestStatus.restored,
          ),
        );
      });
    });

    on<_SetLocationTrackingNotificationCopy>((event, emit) async {
      emit(
        state.copyWith(
          locationTrackingActiveTitle: event.locationTrackingActiveTitle,
          locationTrackingActiveLabel: event.locationTrackingActiveLabel,
        ),
      );
    });
  }
}

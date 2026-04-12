import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/setting/domain/domain.dart';

import '../../../core/core.dart';
import '../data/data.dart';

part 'setting_bloc.freezed.dart';
part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final SettingRepository repo;

  SettingBloc(@visibleForTesting this.repo) : super(const _Initial()) {
    on<_UpdateGpsTrackingInterval>((event, emit) async {
      final result = await repo.updateGpsTrackingInterval(interval: event.interval);
      result.match(
        (err) => emit(state.copyWith(intervalState: RequestStatus.error, errorMessage: err.message)),
        (data) => emit(state.copyWith(intervalState: RequestStatus.success, interval: event.interval)),
      );
    });

    on<_GetGpsTrackingInterval>((event, emit) async {
      emit(state.copyWith(intervalState: RequestStatus.loading));
      final result = await repo.getGpsTrackingInterval();
      result.match(
        (err) => emit(state.copyWith(intervalState: RequestStatus.error, errorMessage: err.message)),
        (data) => emit(state.copyWith(intervalState: RequestStatus.success, interval: data)),
      );
    });

    on<_UpdateGpsAccuracy>((event, emit) async {
      final result = await repo.updateGpsAccuracy(accuracy: event.interval);
      result.match(
        (err) => emit(state.copyWith(accuracyState: RequestStatus.error, errorMessage: err.message)),
        (data) => emit(state.copyWith(accuracyState: RequestStatus.success, accuracy: event.interval)),
      );
    });

    on<_GetGpsAccuracy>((event, emit) async {
      emit(state.copyWith(accuracyState: RequestStatus.loading));
      final result = await repo.getGpsAccuracy();
      result.match(
        (err) => emit(state.copyWith(accuracyState: RequestStatus.error, errorMessage: err.message)),
        (data) => emit(state.copyWith(accuracyState: RequestStatus.success, accuracy: data)),
      );
    });

    on<_UpdateKeepScreenOn>((event, emit) async {
      final result = await repo.updateKeepScreenOn(isKeepScreenOn: event.isKeepScreenOn);
      result.match(
        (err) => emit(state.copyWith(keepScreenOnState: RequestStatus.error, errorMessage: err.message)),
        (data) => emit(state.copyWith(keepScreenOnState: RequestStatus.success, isKeepScreenOn: event.isKeepScreenOn)),
      );
    });

    on<_IsKeepScreenOn>((event, emit) async {
      emit(state.copyWith(keepScreenOnState: RequestStatus.loading));
      final result = await repo.isKeepScreenOn();
      result.match(
        (err) => emit(state.copyWith(keepScreenOnState: RequestStatus.error, errorMessage: err.message)),
        (data) => emit(state.copyWith(keepScreenOnState: RequestStatus.success, isKeepScreenOn: data)),
      );
    });
  }
}

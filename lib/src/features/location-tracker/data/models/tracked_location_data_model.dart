import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracked_location_data_model.freezed.dart';

@freezed
abstract class TrackedLocationDataModel with _$TrackedLocationDataModel {
  const factory TrackedLocationDataModel({int? id, required String startedTime, String? stoppedTime, int? duration}) =
      _TrackedLocationDataModel;

  factory TrackedLocationDataModel.fromMap(Map<String, dynamic> map) {
    return TrackedLocationDataModel(
      id: map['id'] as int?,
      startedTime: map['started_time'] as String,
      stoppedTime: map['stopped_time'] as String?,
      duration: map['duration'] as int?,
    );
  }
}

extension TrackedLocationDataModelX on TrackedLocationDataModel {
  Map<String, dynamic> toMap() {
    return {'started_time': startedTime, 'stopped_time': stoppedTime, 'duration': duration};
  }
}

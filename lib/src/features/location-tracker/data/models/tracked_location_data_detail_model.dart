import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracked_location_data_detail_model.freezed.dart';

@freezed
abstract class TrackedLocationDataDetailModel with _$TrackedLocationDataDetailModel {
  const factory TrackedLocationDataDetailModel({
    int? id,
    required int parentId,
    required double latitude,
    required double longitude,
    required String timestamp,
    required String? accuracy,
  }) = _TrackedLocationDataDetailModel;

  factory TrackedLocationDataDetailModel.fromMap(Map<String, dynamic> map) {
    return TrackedLocationDataDetailModel(
      id: map['id'] as int?,
      parentId: map['parent_id'] as int,
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
      timestamp: map['timestamp'] as String,
      accuracy: map['accuracy'] as String?,
    );
  }
}

extension TrackedLocationDataDetailModelX on TrackedLocationDataDetailModel {
  Map<String, dynamic> toMap() {
    return {
      'parent_id': parentId,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp,
      'accuracy': accuracy,
    };
  }
}

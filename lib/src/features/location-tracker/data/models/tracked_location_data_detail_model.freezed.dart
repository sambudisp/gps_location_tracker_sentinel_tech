// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracked_location_data_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrackedLocationDataDetailModel {

 int? get id; int get parentId; double get latitude; double get longitude; String get timestamp; String? get accuracy;
/// Create a copy of TrackedLocationDataDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackedLocationDataDetailModelCopyWith<TrackedLocationDataDetailModel> get copyWith => _$TrackedLocationDataDetailModelCopyWithImpl<TrackedLocationDataDetailModel>(this as TrackedLocationDataDetailModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackedLocationDataDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy));
}


@override
int get hashCode => Object.hash(runtimeType,id,parentId,latitude,longitude,timestamp,accuracy);

@override
String toString() {
  return 'TrackedLocationDataDetailModel(id: $id, parentId: $parentId, latitude: $latitude, longitude: $longitude, timestamp: $timestamp, accuracy: $accuracy)';
}


}

/// @nodoc
abstract mixin class $TrackedLocationDataDetailModelCopyWith<$Res>  {
  factory $TrackedLocationDataDetailModelCopyWith(TrackedLocationDataDetailModel value, $Res Function(TrackedLocationDataDetailModel) _then) = _$TrackedLocationDataDetailModelCopyWithImpl;
@useResult
$Res call({
 int? id, int parentId, double latitude, double longitude, String timestamp, String? accuracy
});




}
/// @nodoc
class _$TrackedLocationDataDetailModelCopyWithImpl<$Res>
    implements $TrackedLocationDataDetailModelCopyWith<$Res> {
  _$TrackedLocationDataDetailModelCopyWithImpl(this._self, this._then);

  final TrackedLocationDataDetailModel _self;
  final $Res Function(TrackedLocationDataDetailModel) _then;

/// Create a copy of TrackedLocationDataDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? parentId = null,Object? latitude = null,Object? longitude = null,Object? timestamp = null,Object? accuracy = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,parentId: null == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackedLocationDataDetailModel].
extension TrackedLocationDataDetailModelPatterns on TrackedLocationDataDetailModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackedLocationDataDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackedLocationDataDetailModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackedLocationDataDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _TrackedLocationDataDetailModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackedLocationDataDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrackedLocationDataDetailModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int parentId,  double latitude,  double longitude,  String timestamp,  String? accuracy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackedLocationDataDetailModel() when $default != null:
return $default(_that.id,_that.parentId,_that.latitude,_that.longitude,_that.timestamp,_that.accuracy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int parentId,  double latitude,  double longitude,  String timestamp,  String? accuracy)  $default,) {final _that = this;
switch (_that) {
case _TrackedLocationDataDetailModel():
return $default(_that.id,_that.parentId,_that.latitude,_that.longitude,_that.timestamp,_that.accuracy);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int parentId,  double latitude,  double longitude,  String timestamp,  String? accuracy)?  $default,) {final _that = this;
switch (_that) {
case _TrackedLocationDataDetailModel() when $default != null:
return $default(_that.id,_that.parentId,_that.latitude,_that.longitude,_that.timestamp,_that.accuracy);case _:
  return null;

}
}

}

/// @nodoc


class _TrackedLocationDataDetailModel implements TrackedLocationDataDetailModel {
  const _TrackedLocationDataDetailModel({this.id, required this.parentId, required this.latitude, required this.longitude, required this.timestamp, required this.accuracy});
  

@override final  int? id;
@override final  int parentId;
@override final  double latitude;
@override final  double longitude;
@override final  String timestamp;
@override final  String? accuracy;

/// Create a copy of TrackedLocationDataDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackedLocationDataDetailModelCopyWith<_TrackedLocationDataDetailModel> get copyWith => __$TrackedLocationDataDetailModelCopyWithImpl<_TrackedLocationDataDetailModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackedLocationDataDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy));
}


@override
int get hashCode => Object.hash(runtimeType,id,parentId,latitude,longitude,timestamp,accuracy);

@override
String toString() {
  return 'TrackedLocationDataDetailModel(id: $id, parentId: $parentId, latitude: $latitude, longitude: $longitude, timestamp: $timestamp, accuracy: $accuracy)';
}


}

/// @nodoc
abstract mixin class _$TrackedLocationDataDetailModelCopyWith<$Res> implements $TrackedLocationDataDetailModelCopyWith<$Res> {
  factory _$TrackedLocationDataDetailModelCopyWith(_TrackedLocationDataDetailModel value, $Res Function(_TrackedLocationDataDetailModel) _then) = __$TrackedLocationDataDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int parentId, double latitude, double longitude, String timestamp, String? accuracy
});




}
/// @nodoc
class __$TrackedLocationDataDetailModelCopyWithImpl<$Res>
    implements _$TrackedLocationDataDetailModelCopyWith<$Res> {
  __$TrackedLocationDataDetailModelCopyWithImpl(this._self, this._then);

  final _TrackedLocationDataDetailModel _self;
  final $Res Function(_TrackedLocationDataDetailModel) _then;

/// Create a copy of TrackedLocationDataDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? parentId = null,Object? latitude = null,Object? longitude = null,Object? timestamp = null,Object? accuracy = freezed,}) {
  return _then(_TrackedLocationDataDetailModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,parentId: null == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_tracker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationTrackerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationTrackerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationTrackerEvent()';
}


}

/// @nodoc
class $LocationTrackerEventCopyWith<$Res>  {
$LocationTrackerEventCopyWith(LocationTrackerEvent _, $Res Function(LocationTrackerEvent) __);
}


/// Adds pattern-matching-related methods to [LocationTrackerEvent].
extension LocationTrackerEventPatterns on LocationTrackerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StartLocationTracking value)?  startLocationTracking,TResult Function( _StopLocationTracking value)?  stopLocationTracking,TResult Function( _StartLocationTrackingByInterval value)?  startLocationTrackingByInterval,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartLocationTracking() when startLocationTracking != null:
return startLocationTracking(_that);case _StopLocationTracking() when stopLocationTracking != null:
return stopLocationTracking(_that);case _StartLocationTrackingByInterval() when startLocationTrackingByInterval != null:
return startLocationTrackingByInterval(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StartLocationTracking value)  startLocationTracking,required TResult Function( _StopLocationTracking value)  stopLocationTracking,required TResult Function( _StartLocationTrackingByInterval value)  startLocationTrackingByInterval,}){
final _that = this;
switch (_that) {
case _StartLocationTracking():
return startLocationTracking(_that);case _StopLocationTracking():
return stopLocationTracking(_that);case _StartLocationTrackingByInterval():
return startLocationTrackingByInterval(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StartLocationTracking value)?  startLocationTracking,TResult? Function( _StopLocationTracking value)?  stopLocationTracking,TResult? Function( _StartLocationTrackingByInterval value)?  startLocationTrackingByInterval,}){
final _that = this;
switch (_that) {
case _StartLocationTracking() when startLocationTracking != null:
return startLocationTracking(_that);case _StopLocationTracking() when stopLocationTracking != null:
return stopLocationTracking(_that);case _StartLocationTrackingByInterval() when startLocationTrackingByInterval != null:
return startLocationTrackingByInterval(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  startLocationTracking,TResult Function()?  stopLocationTracking,TResult Function()?  startLocationTrackingByInterval,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartLocationTracking() when startLocationTracking != null:
return startLocationTracking();case _StopLocationTracking() when stopLocationTracking != null:
return stopLocationTracking();case _StartLocationTrackingByInterval() when startLocationTrackingByInterval != null:
return startLocationTrackingByInterval();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  startLocationTracking,required TResult Function()  stopLocationTracking,required TResult Function()  startLocationTrackingByInterval,}) {final _that = this;
switch (_that) {
case _StartLocationTracking():
return startLocationTracking();case _StopLocationTracking():
return stopLocationTracking();case _StartLocationTrackingByInterval():
return startLocationTrackingByInterval();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  startLocationTracking,TResult? Function()?  stopLocationTracking,TResult? Function()?  startLocationTrackingByInterval,}) {final _that = this;
switch (_that) {
case _StartLocationTracking() when startLocationTracking != null:
return startLocationTracking();case _StopLocationTracking() when stopLocationTracking != null:
return stopLocationTracking();case _StartLocationTrackingByInterval() when startLocationTrackingByInterval != null:
return startLocationTrackingByInterval();case _:
  return null;

}
}

}

/// @nodoc


class _StartLocationTracking implements LocationTrackerEvent {
  const _StartLocationTracking();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartLocationTracking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationTrackerEvent.startLocationTracking()';
}


}




/// @nodoc


class _StopLocationTracking implements LocationTrackerEvent {
  const _StopLocationTracking();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopLocationTracking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationTrackerEvent.stopLocationTracking()';
}


}




/// @nodoc


class _StartLocationTrackingByInterval implements LocationTrackerEvent {
  const _StartLocationTrackingByInterval();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartLocationTrackingByInterval);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationTrackerEvent.startLocationTrackingByInterval()';
}


}




/// @nodoc
mixin _$LocationTrackerState {

 DbStatus get stateLocationTracking; DbStatus get stateLocationTrackingByInterval; String get errorMessage; int? get activeTrackingId; String? get activeTrackingStartedTime;
/// Create a copy of LocationTrackerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationTrackerStateCopyWith<LocationTrackerState> get copyWith => _$LocationTrackerStateCopyWithImpl<LocationTrackerState>(this as LocationTrackerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationTrackerState&&(identical(other.stateLocationTracking, stateLocationTracking) || other.stateLocationTracking == stateLocationTracking)&&(identical(other.stateLocationTrackingByInterval, stateLocationTrackingByInterval) || other.stateLocationTrackingByInterval == stateLocationTrackingByInterval)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.activeTrackingId, activeTrackingId) || other.activeTrackingId == activeTrackingId)&&(identical(other.activeTrackingStartedTime, activeTrackingStartedTime) || other.activeTrackingStartedTime == activeTrackingStartedTime));
}


@override
int get hashCode => Object.hash(runtimeType,stateLocationTracking,stateLocationTrackingByInterval,errorMessage,activeTrackingId,activeTrackingStartedTime);

@override
String toString() {
  return 'LocationTrackerState(stateLocationTracking: $stateLocationTracking, stateLocationTrackingByInterval: $stateLocationTrackingByInterval, errorMessage: $errorMessage, activeTrackingId: $activeTrackingId, activeTrackingStartedTime: $activeTrackingStartedTime)';
}


}

/// @nodoc
abstract mixin class $LocationTrackerStateCopyWith<$Res>  {
  factory $LocationTrackerStateCopyWith(LocationTrackerState value, $Res Function(LocationTrackerState) _then) = _$LocationTrackerStateCopyWithImpl;
@useResult
$Res call({
 DbStatus stateLocationTracking, DbStatus stateLocationTrackingByInterval, String errorMessage, int? activeTrackingId, String? activeTrackingStartedTime
});




}
/// @nodoc
class _$LocationTrackerStateCopyWithImpl<$Res>
    implements $LocationTrackerStateCopyWith<$Res> {
  _$LocationTrackerStateCopyWithImpl(this._self, this._then);

  final LocationTrackerState _self;
  final $Res Function(LocationTrackerState) _then;

/// Create a copy of LocationTrackerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stateLocationTracking = null,Object? stateLocationTrackingByInterval = null,Object? errorMessage = null,Object? activeTrackingId = freezed,Object? activeTrackingStartedTime = freezed,}) {
  return _then(_self.copyWith(
stateLocationTracking: null == stateLocationTracking ? _self.stateLocationTracking : stateLocationTracking // ignore: cast_nullable_to_non_nullable
as DbStatus,stateLocationTrackingByInterval: null == stateLocationTrackingByInterval ? _self.stateLocationTrackingByInterval : stateLocationTrackingByInterval // ignore: cast_nullable_to_non_nullable
as DbStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,activeTrackingId: freezed == activeTrackingId ? _self.activeTrackingId : activeTrackingId // ignore: cast_nullable_to_non_nullable
as int?,activeTrackingStartedTime: freezed == activeTrackingStartedTime ? _self.activeTrackingStartedTime : activeTrackingStartedTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationTrackerState].
extension LocationTrackerStatePatterns on LocationTrackerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Initial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Initial value)  $default,){
final _that = this;
switch (_that) {
case _Initial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Initial value)?  $default,){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DbStatus stateLocationTracking,  DbStatus stateLocationTrackingByInterval,  String errorMessage,  int? activeTrackingId,  String? activeTrackingStartedTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.stateLocationTracking,_that.stateLocationTrackingByInterval,_that.errorMessage,_that.activeTrackingId,_that.activeTrackingStartedTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DbStatus stateLocationTracking,  DbStatus stateLocationTrackingByInterval,  String errorMessage,  int? activeTrackingId,  String? activeTrackingStartedTime)  $default,) {final _that = this;
switch (_that) {
case _Initial():
return $default(_that.stateLocationTracking,_that.stateLocationTrackingByInterval,_that.errorMessage,_that.activeTrackingId,_that.activeTrackingStartedTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DbStatus stateLocationTracking,  DbStatus stateLocationTrackingByInterval,  String errorMessage,  int? activeTrackingId,  String? activeTrackingStartedTime)?  $default,) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.stateLocationTracking,_that.stateLocationTrackingByInterval,_that.errorMessage,_that.activeTrackingId,_that.activeTrackingStartedTime);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LocationTrackerState {
  const _Initial({this.stateLocationTracking = DbStatus.idle, this.stateLocationTrackingByInterval = DbStatus.idle, this.errorMessage = '', this.activeTrackingId = 0, this.activeTrackingStartedTime = ''});
  

@override@JsonKey() final  DbStatus stateLocationTracking;
@override@JsonKey() final  DbStatus stateLocationTrackingByInterval;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  int? activeTrackingId;
@override@JsonKey() final  String? activeTrackingStartedTime;

/// Create a copy of LocationTrackerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.stateLocationTracking, stateLocationTracking) || other.stateLocationTracking == stateLocationTracking)&&(identical(other.stateLocationTrackingByInterval, stateLocationTrackingByInterval) || other.stateLocationTrackingByInterval == stateLocationTrackingByInterval)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.activeTrackingId, activeTrackingId) || other.activeTrackingId == activeTrackingId)&&(identical(other.activeTrackingStartedTime, activeTrackingStartedTime) || other.activeTrackingStartedTime == activeTrackingStartedTime));
}


@override
int get hashCode => Object.hash(runtimeType,stateLocationTracking,stateLocationTrackingByInterval,errorMessage,activeTrackingId,activeTrackingStartedTime);

@override
String toString() {
  return 'LocationTrackerState(stateLocationTracking: $stateLocationTracking, stateLocationTrackingByInterval: $stateLocationTrackingByInterval, errorMessage: $errorMessage, activeTrackingId: $activeTrackingId, activeTrackingStartedTime: $activeTrackingStartedTime)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $LocationTrackerStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 DbStatus stateLocationTracking, DbStatus stateLocationTrackingByInterval, String errorMessage, int? activeTrackingId, String? activeTrackingStartedTime
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of LocationTrackerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stateLocationTracking = null,Object? stateLocationTrackingByInterval = null,Object? errorMessage = null,Object? activeTrackingId = freezed,Object? activeTrackingStartedTime = freezed,}) {
  return _then(_Initial(
stateLocationTracking: null == stateLocationTracking ? _self.stateLocationTracking : stateLocationTracking // ignore: cast_nullable_to_non_nullable
as DbStatus,stateLocationTrackingByInterval: null == stateLocationTrackingByInterval ? _self.stateLocationTrackingByInterval : stateLocationTrackingByInterval // ignore: cast_nullable_to_non_nullable
as DbStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,activeTrackingId: freezed == activeTrackingId ? _self.activeTrackingId : activeTrackingId // ignore: cast_nullable_to_non_nullable
as int?,activeTrackingStartedTime: freezed == activeTrackingStartedTime ? _self.activeTrackingStartedTime : activeTrackingStartedTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

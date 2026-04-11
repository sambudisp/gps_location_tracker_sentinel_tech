// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingEvent()';
}


}

/// @nodoc
class $SettingEventCopyWith<$Res>  {
$SettingEventCopyWith(SettingEvent _, $Res Function(SettingEvent) __);
}


/// Adds pattern-matching-related methods to [SettingEvent].
extension SettingEventPatterns on SettingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UpdateGpsTrackingInterval value)?  updateGpsTrackingInterval,TResult Function( _GetGpsTrackingInterval value)?  getGpsTrackingInterval,TResult Function( _UpdateGpsAccuracy value)?  updateGpsAccuracy,TResult Function( _GetGpsAccuracy value)?  getGpsAccuracy,TResult Function( _UpdateKeepScreenOn value)?  updateKeepScreenOn,TResult Function( _IsKeepScreenOn value)?  isKeepScreenOn,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateGpsTrackingInterval() when updateGpsTrackingInterval != null:
return updateGpsTrackingInterval(_that);case _GetGpsTrackingInterval() when getGpsTrackingInterval != null:
return getGpsTrackingInterval(_that);case _UpdateGpsAccuracy() when updateGpsAccuracy != null:
return updateGpsAccuracy(_that);case _GetGpsAccuracy() when getGpsAccuracy != null:
return getGpsAccuracy(_that);case _UpdateKeepScreenOn() when updateKeepScreenOn != null:
return updateKeepScreenOn(_that);case _IsKeepScreenOn() when isKeepScreenOn != null:
return isKeepScreenOn(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UpdateGpsTrackingInterval value)  updateGpsTrackingInterval,required TResult Function( _GetGpsTrackingInterval value)  getGpsTrackingInterval,required TResult Function( _UpdateGpsAccuracy value)  updateGpsAccuracy,required TResult Function( _GetGpsAccuracy value)  getGpsAccuracy,required TResult Function( _UpdateKeepScreenOn value)  updateKeepScreenOn,required TResult Function( _IsKeepScreenOn value)  isKeepScreenOn,}){
final _that = this;
switch (_that) {
case _UpdateGpsTrackingInterval():
return updateGpsTrackingInterval(_that);case _GetGpsTrackingInterval():
return getGpsTrackingInterval(_that);case _UpdateGpsAccuracy():
return updateGpsAccuracy(_that);case _GetGpsAccuracy():
return getGpsAccuracy(_that);case _UpdateKeepScreenOn():
return updateKeepScreenOn(_that);case _IsKeepScreenOn():
return isKeepScreenOn(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UpdateGpsTrackingInterval value)?  updateGpsTrackingInterval,TResult? Function( _GetGpsTrackingInterval value)?  getGpsTrackingInterval,TResult? Function( _UpdateGpsAccuracy value)?  updateGpsAccuracy,TResult? Function( _GetGpsAccuracy value)?  getGpsAccuracy,TResult? Function( _UpdateKeepScreenOn value)?  updateKeepScreenOn,TResult? Function( _IsKeepScreenOn value)?  isKeepScreenOn,}){
final _that = this;
switch (_that) {
case _UpdateGpsTrackingInterval() when updateGpsTrackingInterval != null:
return updateGpsTrackingInterval(_that);case _GetGpsTrackingInterval() when getGpsTrackingInterval != null:
return getGpsTrackingInterval(_that);case _UpdateGpsAccuracy() when updateGpsAccuracy != null:
return updateGpsAccuracy(_that);case _GetGpsAccuracy() when getGpsAccuracy != null:
return getGpsAccuracy(_that);case _UpdateKeepScreenOn() when updateKeepScreenOn != null:
return updateKeepScreenOn(_that);case _IsKeepScreenOn() when isKeepScreenOn != null:
return isKeepScreenOn(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( GpsTrackingInterval interval)?  updateGpsTrackingInterval,TResult Function()?  getGpsTrackingInterval,TResult Function( GpsAccuracy interval)?  updateGpsAccuracy,TResult Function()?  getGpsAccuracy,TResult Function( bool isKeepScreenOn)?  updateKeepScreenOn,TResult Function()?  isKeepScreenOn,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateGpsTrackingInterval() when updateGpsTrackingInterval != null:
return updateGpsTrackingInterval(_that.interval);case _GetGpsTrackingInterval() when getGpsTrackingInterval != null:
return getGpsTrackingInterval();case _UpdateGpsAccuracy() when updateGpsAccuracy != null:
return updateGpsAccuracy(_that.interval);case _GetGpsAccuracy() when getGpsAccuracy != null:
return getGpsAccuracy();case _UpdateKeepScreenOn() when updateKeepScreenOn != null:
return updateKeepScreenOn(_that.isKeepScreenOn);case _IsKeepScreenOn() when isKeepScreenOn != null:
return isKeepScreenOn();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( GpsTrackingInterval interval)  updateGpsTrackingInterval,required TResult Function()  getGpsTrackingInterval,required TResult Function( GpsAccuracy interval)  updateGpsAccuracy,required TResult Function()  getGpsAccuracy,required TResult Function( bool isKeepScreenOn)  updateKeepScreenOn,required TResult Function()  isKeepScreenOn,}) {final _that = this;
switch (_that) {
case _UpdateGpsTrackingInterval():
return updateGpsTrackingInterval(_that.interval);case _GetGpsTrackingInterval():
return getGpsTrackingInterval();case _UpdateGpsAccuracy():
return updateGpsAccuracy(_that.interval);case _GetGpsAccuracy():
return getGpsAccuracy();case _UpdateKeepScreenOn():
return updateKeepScreenOn(_that.isKeepScreenOn);case _IsKeepScreenOn():
return isKeepScreenOn();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( GpsTrackingInterval interval)?  updateGpsTrackingInterval,TResult? Function()?  getGpsTrackingInterval,TResult? Function( GpsAccuracy interval)?  updateGpsAccuracy,TResult? Function()?  getGpsAccuracy,TResult? Function( bool isKeepScreenOn)?  updateKeepScreenOn,TResult? Function()?  isKeepScreenOn,}) {final _that = this;
switch (_that) {
case _UpdateGpsTrackingInterval() when updateGpsTrackingInterval != null:
return updateGpsTrackingInterval(_that.interval);case _GetGpsTrackingInterval() when getGpsTrackingInterval != null:
return getGpsTrackingInterval();case _UpdateGpsAccuracy() when updateGpsAccuracy != null:
return updateGpsAccuracy(_that.interval);case _GetGpsAccuracy() when getGpsAccuracy != null:
return getGpsAccuracy();case _UpdateKeepScreenOn() when updateKeepScreenOn != null:
return updateKeepScreenOn(_that.isKeepScreenOn);case _IsKeepScreenOn() when isKeepScreenOn != null:
return isKeepScreenOn();case _:
  return null;

}
}

}

/// @nodoc


class _UpdateGpsTrackingInterval implements SettingEvent {
  const _UpdateGpsTrackingInterval({required this.interval});
  

 final  GpsTrackingInterval interval;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateGpsTrackingIntervalCopyWith<_UpdateGpsTrackingInterval> get copyWith => __$UpdateGpsTrackingIntervalCopyWithImpl<_UpdateGpsTrackingInterval>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateGpsTrackingInterval&&(identical(other.interval, interval) || other.interval == interval));
}


@override
int get hashCode => Object.hash(runtimeType,interval);

@override
String toString() {
  return 'SettingEvent.updateGpsTrackingInterval(interval: $interval)';
}


}

/// @nodoc
abstract mixin class _$UpdateGpsTrackingIntervalCopyWith<$Res> implements $SettingEventCopyWith<$Res> {
  factory _$UpdateGpsTrackingIntervalCopyWith(_UpdateGpsTrackingInterval value, $Res Function(_UpdateGpsTrackingInterval) _then) = __$UpdateGpsTrackingIntervalCopyWithImpl;
@useResult
$Res call({
 GpsTrackingInterval interval
});




}
/// @nodoc
class __$UpdateGpsTrackingIntervalCopyWithImpl<$Res>
    implements _$UpdateGpsTrackingIntervalCopyWith<$Res> {
  __$UpdateGpsTrackingIntervalCopyWithImpl(this._self, this._then);

  final _UpdateGpsTrackingInterval _self;
  final $Res Function(_UpdateGpsTrackingInterval) _then;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? interval = null,}) {
  return _then(_UpdateGpsTrackingInterval(
interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as GpsTrackingInterval,
  ));
}


}

/// @nodoc


class _GetGpsTrackingInterval implements SettingEvent {
  const _GetGpsTrackingInterval();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetGpsTrackingInterval);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingEvent.getGpsTrackingInterval()';
}


}




/// @nodoc


class _UpdateGpsAccuracy implements SettingEvent {
  const _UpdateGpsAccuracy({required this.interval});
  

 final  GpsAccuracy interval;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateGpsAccuracyCopyWith<_UpdateGpsAccuracy> get copyWith => __$UpdateGpsAccuracyCopyWithImpl<_UpdateGpsAccuracy>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateGpsAccuracy&&(identical(other.interval, interval) || other.interval == interval));
}


@override
int get hashCode => Object.hash(runtimeType,interval);

@override
String toString() {
  return 'SettingEvent.updateGpsAccuracy(interval: $interval)';
}


}

/// @nodoc
abstract mixin class _$UpdateGpsAccuracyCopyWith<$Res> implements $SettingEventCopyWith<$Res> {
  factory _$UpdateGpsAccuracyCopyWith(_UpdateGpsAccuracy value, $Res Function(_UpdateGpsAccuracy) _then) = __$UpdateGpsAccuracyCopyWithImpl;
@useResult
$Res call({
 GpsAccuracy interval
});




}
/// @nodoc
class __$UpdateGpsAccuracyCopyWithImpl<$Res>
    implements _$UpdateGpsAccuracyCopyWith<$Res> {
  __$UpdateGpsAccuracyCopyWithImpl(this._self, this._then);

  final _UpdateGpsAccuracy _self;
  final $Res Function(_UpdateGpsAccuracy) _then;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? interval = null,}) {
  return _then(_UpdateGpsAccuracy(
interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as GpsAccuracy,
  ));
}


}

/// @nodoc


class _GetGpsAccuracy implements SettingEvent {
  const _GetGpsAccuracy();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetGpsAccuracy);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingEvent.getGpsAccuracy()';
}


}




/// @nodoc


class _UpdateKeepScreenOn implements SettingEvent {
  const _UpdateKeepScreenOn({required this.isKeepScreenOn});
  

 final  bool isKeepScreenOn;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateKeepScreenOnCopyWith<_UpdateKeepScreenOn> get copyWith => __$UpdateKeepScreenOnCopyWithImpl<_UpdateKeepScreenOn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateKeepScreenOn&&(identical(other.isKeepScreenOn, isKeepScreenOn) || other.isKeepScreenOn == isKeepScreenOn));
}


@override
int get hashCode => Object.hash(runtimeType,isKeepScreenOn);

@override
String toString() {
  return 'SettingEvent.updateKeepScreenOn(isKeepScreenOn: $isKeepScreenOn)';
}


}

/// @nodoc
abstract mixin class _$UpdateKeepScreenOnCopyWith<$Res> implements $SettingEventCopyWith<$Res> {
  factory _$UpdateKeepScreenOnCopyWith(_UpdateKeepScreenOn value, $Res Function(_UpdateKeepScreenOn) _then) = __$UpdateKeepScreenOnCopyWithImpl;
@useResult
$Res call({
 bool isKeepScreenOn
});




}
/// @nodoc
class __$UpdateKeepScreenOnCopyWithImpl<$Res>
    implements _$UpdateKeepScreenOnCopyWith<$Res> {
  __$UpdateKeepScreenOnCopyWithImpl(this._self, this._then);

  final _UpdateKeepScreenOn _self;
  final $Res Function(_UpdateKeepScreenOn) _then;

/// Create a copy of SettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isKeepScreenOn = null,}) {
  return _then(_UpdateKeepScreenOn(
isKeepScreenOn: null == isKeepScreenOn ? _self.isKeepScreenOn : isKeepScreenOn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _IsKeepScreenOn implements SettingEvent {
  const _IsKeepScreenOn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IsKeepScreenOn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingEvent.isKeepScreenOn()';
}


}




/// @nodoc
mixin _$SettingState {

 DbStatus get intervalState; DbStatus get accuracyState; DbStatus get keepScreenOnState; String get errorMessage; GpsTrackingInterval? get interval; GpsAccuracy? get accuracy; bool get isKeepScreenOn;
/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingStateCopyWith<SettingState> get copyWith => _$SettingStateCopyWithImpl<SettingState>(this as SettingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingState&&(identical(other.intervalState, intervalState) || other.intervalState == intervalState)&&(identical(other.accuracyState, accuracyState) || other.accuracyState == accuracyState)&&(identical(other.keepScreenOnState, keepScreenOnState) || other.keepScreenOnState == keepScreenOnState)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.isKeepScreenOn, isKeepScreenOn) || other.isKeepScreenOn == isKeepScreenOn));
}


@override
int get hashCode => Object.hash(runtimeType,intervalState,accuracyState,keepScreenOnState,errorMessage,interval,accuracy,isKeepScreenOn);

@override
String toString() {
  return 'SettingState(intervalState: $intervalState, accuracyState: $accuracyState, keepScreenOnState: $keepScreenOnState, errorMessage: $errorMessage, interval: $interval, accuracy: $accuracy, isKeepScreenOn: $isKeepScreenOn)';
}


}

/// @nodoc
abstract mixin class $SettingStateCopyWith<$Res>  {
  factory $SettingStateCopyWith(SettingState value, $Res Function(SettingState) _then) = _$SettingStateCopyWithImpl;
@useResult
$Res call({
 DbStatus intervalState, DbStatus accuracyState, DbStatus keepScreenOnState, String errorMessage, GpsTrackingInterval? interval, GpsAccuracy? accuracy, bool isKeepScreenOn
});




}
/// @nodoc
class _$SettingStateCopyWithImpl<$Res>
    implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._self, this._then);

  final SettingState _self;
  final $Res Function(SettingState) _then;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? intervalState = null,Object? accuracyState = null,Object? keepScreenOnState = null,Object? errorMessage = null,Object? interval = freezed,Object? accuracy = freezed,Object? isKeepScreenOn = null,}) {
  return _then(_self.copyWith(
intervalState: null == intervalState ? _self.intervalState : intervalState // ignore: cast_nullable_to_non_nullable
as DbStatus,accuracyState: null == accuracyState ? _self.accuracyState : accuracyState // ignore: cast_nullable_to_non_nullable
as DbStatus,keepScreenOnState: null == keepScreenOnState ? _self.keepScreenOnState : keepScreenOnState // ignore: cast_nullable_to_non_nullable
as DbStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,interval: freezed == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as GpsTrackingInterval?,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as GpsAccuracy?,isKeepScreenOn: null == isKeepScreenOn ? _self.isKeepScreenOn : isKeepScreenOn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingState].
extension SettingStatePatterns on SettingState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DbStatus intervalState,  DbStatus accuracyState,  DbStatus keepScreenOnState,  String errorMessage,  GpsTrackingInterval? interval,  GpsAccuracy? accuracy,  bool isKeepScreenOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.intervalState,_that.accuracyState,_that.keepScreenOnState,_that.errorMessage,_that.interval,_that.accuracy,_that.isKeepScreenOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DbStatus intervalState,  DbStatus accuracyState,  DbStatus keepScreenOnState,  String errorMessage,  GpsTrackingInterval? interval,  GpsAccuracy? accuracy,  bool isKeepScreenOn)  $default,) {final _that = this;
switch (_that) {
case _Initial():
return $default(_that.intervalState,_that.accuracyState,_that.keepScreenOnState,_that.errorMessage,_that.interval,_that.accuracy,_that.isKeepScreenOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DbStatus intervalState,  DbStatus accuracyState,  DbStatus keepScreenOnState,  String errorMessage,  GpsTrackingInterval? interval,  GpsAccuracy? accuracy,  bool isKeepScreenOn)?  $default,) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.intervalState,_that.accuracyState,_that.keepScreenOnState,_that.errorMessage,_that.interval,_that.accuracy,_that.isKeepScreenOn);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SettingState {
  const _Initial({this.intervalState = DbStatus.idle, this.accuracyState = DbStatus.idle, this.keepScreenOnState = DbStatus.idle, this.errorMessage = '', this.interval, this.accuracy, this.isKeepScreenOn = false});
  

@override@JsonKey() final  DbStatus intervalState;
@override@JsonKey() final  DbStatus accuracyState;
@override@JsonKey() final  DbStatus keepScreenOnState;
@override@JsonKey() final  String errorMessage;
@override final  GpsTrackingInterval? interval;
@override final  GpsAccuracy? accuracy;
@override@JsonKey() final  bool isKeepScreenOn;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.intervalState, intervalState) || other.intervalState == intervalState)&&(identical(other.accuracyState, accuracyState) || other.accuracyState == accuracyState)&&(identical(other.keepScreenOnState, keepScreenOnState) || other.keepScreenOnState == keepScreenOnState)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.isKeepScreenOn, isKeepScreenOn) || other.isKeepScreenOn == isKeepScreenOn));
}


@override
int get hashCode => Object.hash(runtimeType,intervalState,accuracyState,keepScreenOnState,errorMessage,interval,accuracy,isKeepScreenOn);

@override
String toString() {
  return 'SettingState(intervalState: $intervalState, accuracyState: $accuracyState, keepScreenOnState: $keepScreenOnState, errorMessage: $errorMessage, interval: $interval, accuracy: $accuracy, isKeepScreenOn: $isKeepScreenOn)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $SettingStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 DbStatus intervalState, DbStatus accuracyState, DbStatus keepScreenOnState, String errorMessage, GpsTrackingInterval? interval, GpsAccuracy? accuracy, bool isKeepScreenOn
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? intervalState = null,Object? accuracyState = null,Object? keepScreenOnState = null,Object? errorMessage = null,Object? interval = freezed,Object? accuracy = freezed,Object? isKeepScreenOn = null,}) {
  return _then(_Initial(
intervalState: null == intervalState ? _self.intervalState : intervalState // ignore: cast_nullable_to_non_nullable
as DbStatus,accuracyState: null == accuracyState ? _self.accuracyState : accuracyState // ignore: cast_nullable_to_non_nullable
as DbStatus,keepScreenOnState: null == keepScreenOnState ? _self.keepScreenOnState : keepScreenOnState // ignore: cast_nullable_to_non_nullable
as DbStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,interval: freezed == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as GpsTrackingInterval?,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as GpsAccuracy?,isKeepScreenOn: null == isKeepScreenOn ? _self.isKeepScreenOn : isKeepScreenOn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StartLocationTracking value)?  startLocationTracking,TResult Function( _StopLocationTracking value)?  stopLocationTracking,TResult Function( _StartLocationTrackingByInterval value)?  startLocationTrackingByInterval,TResult Function( _GetTrackedLocationHistory value)?  getTrackedLocationHistory,TResult Function( _GetTrackedLocationHistoryDetail value)?  getTrackedLocationHistoryDetail,TResult Function( _DeleteTrackedLocationHistory value)?  deleteTrackedLocationHistory,TResult Function( _DeleteAllTrackedLocationHistory value)?  deleteAllTrackedLocationHistory,TResult Function( _RestoreLocationTracking value)?  restoreLocationTracking,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartLocationTracking() when startLocationTracking != null:
return startLocationTracking(_that);case _StopLocationTracking() when stopLocationTracking != null:
return stopLocationTracking(_that);case _StartLocationTrackingByInterval() when startLocationTrackingByInterval != null:
return startLocationTrackingByInterval(_that);case _GetTrackedLocationHistory() when getTrackedLocationHistory != null:
return getTrackedLocationHistory(_that);case _GetTrackedLocationHistoryDetail() when getTrackedLocationHistoryDetail != null:
return getTrackedLocationHistoryDetail(_that);case _DeleteTrackedLocationHistory() when deleteTrackedLocationHistory != null:
return deleteTrackedLocationHistory(_that);case _DeleteAllTrackedLocationHistory() when deleteAllTrackedLocationHistory != null:
return deleteAllTrackedLocationHistory(_that);case _RestoreLocationTracking() when restoreLocationTracking != null:
return restoreLocationTracking(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StartLocationTracking value)  startLocationTracking,required TResult Function( _StopLocationTracking value)  stopLocationTracking,required TResult Function( _StartLocationTrackingByInterval value)  startLocationTrackingByInterval,required TResult Function( _GetTrackedLocationHistory value)  getTrackedLocationHistory,required TResult Function( _GetTrackedLocationHistoryDetail value)  getTrackedLocationHistoryDetail,required TResult Function( _DeleteTrackedLocationHistory value)  deleteTrackedLocationHistory,required TResult Function( _DeleteAllTrackedLocationHistory value)  deleteAllTrackedLocationHistory,required TResult Function( _RestoreLocationTracking value)  restoreLocationTracking,}){
final _that = this;
switch (_that) {
case _StartLocationTracking():
return startLocationTracking(_that);case _StopLocationTracking():
return stopLocationTracking(_that);case _StartLocationTrackingByInterval():
return startLocationTrackingByInterval(_that);case _GetTrackedLocationHistory():
return getTrackedLocationHistory(_that);case _GetTrackedLocationHistoryDetail():
return getTrackedLocationHistoryDetail(_that);case _DeleteTrackedLocationHistory():
return deleteTrackedLocationHistory(_that);case _DeleteAllTrackedLocationHistory():
return deleteAllTrackedLocationHistory(_that);case _RestoreLocationTracking():
return restoreLocationTracking(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StartLocationTracking value)?  startLocationTracking,TResult? Function( _StopLocationTracking value)?  stopLocationTracking,TResult? Function( _StartLocationTrackingByInterval value)?  startLocationTrackingByInterval,TResult? Function( _GetTrackedLocationHistory value)?  getTrackedLocationHistory,TResult? Function( _GetTrackedLocationHistoryDetail value)?  getTrackedLocationHistoryDetail,TResult? Function( _DeleteTrackedLocationHistory value)?  deleteTrackedLocationHistory,TResult? Function( _DeleteAllTrackedLocationHistory value)?  deleteAllTrackedLocationHistory,TResult? Function( _RestoreLocationTracking value)?  restoreLocationTracking,}){
final _that = this;
switch (_that) {
case _StartLocationTracking() when startLocationTracking != null:
return startLocationTracking(_that);case _StopLocationTracking() when stopLocationTracking != null:
return stopLocationTracking(_that);case _StartLocationTrackingByInterval() when startLocationTrackingByInterval != null:
return startLocationTrackingByInterval(_that);case _GetTrackedLocationHistory() when getTrackedLocationHistory != null:
return getTrackedLocationHistory(_that);case _GetTrackedLocationHistoryDetail() when getTrackedLocationHistoryDetail != null:
return getTrackedLocationHistoryDetail(_that);case _DeleteTrackedLocationHistory() when deleteTrackedLocationHistory != null:
return deleteTrackedLocationHistory(_that);case _DeleteAllTrackedLocationHistory() when deleteAllTrackedLocationHistory != null:
return deleteAllTrackedLocationHistory(_that);case _RestoreLocationTracking() when restoreLocationTracking != null:
return restoreLocationTracking(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  startLocationTracking,TResult Function()?  stopLocationTracking,TResult Function()?  startLocationTrackingByInterval,TResult Function()?  getTrackedLocationHistory,TResult Function( int? parentId)?  getTrackedLocationHistoryDetail,TResult Function( int? id)?  deleteTrackedLocationHistory,TResult Function()?  deleteAllTrackedLocationHistory,TResult Function()?  restoreLocationTracking,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartLocationTracking() when startLocationTracking != null:
return startLocationTracking();case _StopLocationTracking() when stopLocationTracking != null:
return stopLocationTracking();case _StartLocationTrackingByInterval() when startLocationTrackingByInterval != null:
return startLocationTrackingByInterval();case _GetTrackedLocationHistory() when getTrackedLocationHistory != null:
return getTrackedLocationHistory();case _GetTrackedLocationHistoryDetail() when getTrackedLocationHistoryDetail != null:
return getTrackedLocationHistoryDetail(_that.parentId);case _DeleteTrackedLocationHistory() when deleteTrackedLocationHistory != null:
return deleteTrackedLocationHistory(_that.id);case _DeleteAllTrackedLocationHistory() when deleteAllTrackedLocationHistory != null:
return deleteAllTrackedLocationHistory();case _RestoreLocationTracking() when restoreLocationTracking != null:
return restoreLocationTracking();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  startLocationTracking,required TResult Function()  stopLocationTracking,required TResult Function()  startLocationTrackingByInterval,required TResult Function()  getTrackedLocationHistory,required TResult Function( int? parentId)  getTrackedLocationHistoryDetail,required TResult Function( int? id)  deleteTrackedLocationHistory,required TResult Function()  deleteAllTrackedLocationHistory,required TResult Function()  restoreLocationTracking,}) {final _that = this;
switch (_that) {
case _StartLocationTracking():
return startLocationTracking();case _StopLocationTracking():
return stopLocationTracking();case _StartLocationTrackingByInterval():
return startLocationTrackingByInterval();case _GetTrackedLocationHistory():
return getTrackedLocationHistory();case _GetTrackedLocationHistoryDetail():
return getTrackedLocationHistoryDetail(_that.parentId);case _DeleteTrackedLocationHistory():
return deleteTrackedLocationHistory(_that.id);case _DeleteAllTrackedLocationHistory():
return deleteAllTrackedLocationHistory();case _RestoreLocationTracking():
return restoreLocationTracking();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  startLocationTracking,TResult? Function()?  stopLocationTracking,TResult? Function()?  startLocationTrackingByInterval,TResult? Function()?  getTrackedLocationHistory,TResult? Function( int? parentId)?  getTrackedLocationHistoryDetail,TResult? Function( int? id)?  deleteTrackedLocationHistory,TResult? Function()?  deleteAllTrackedLocationHistory,TResult? Function()?  restoreLocationTracking,}) {final _that = this;
switch (_that) {
case _StartLocationTracking() when startLocationTracking != null:
return startLocationTracking();case _StopLocationTracking() when stopLocationTracking != null:
return stopLocationTracking();case _StartLocationTrackingByInterval() when startLocationTrackingByInterval != null:
return startLocationTrackingByInterval();case _GetTrackedLocationHistory() when getTrackedLocationHistory != null:
return getTrackedLocationHistory();case _GetTrackedLocationHistoryDetail() when getTrackedLocationHistoryDetail != null:
return getTrackedLocationHistoryDetail(_that.parentId);case _DeleteTrackedLocationHistory() when deleteTrackedLocationHistory != null:
return deleteTrackedLocationHistory(_that.id);case _DeleteAllTrackedLocationHistory() when deleteAllTrackedLocationHistory != null:
return deleteAllTrackedLocationHistory();case _RestoreLocationTracking() when restoreLocationTracking != null:
return restoreLocationTracking();case _:
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


class _GetTrackedLocationHistory implements LocationTrackerEvent {
  const _GetTrackedLocationHistory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTrackedLocationHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationTrackerEvent.getTrackedLocationHistory()';
}


}




/// @nodoc


class _GetTrackedLocationHistoryDetail implements LocationTrackerEvent {
  const _GetTrackedLocationHistoryDetail({required this.parentId});
  

 final  int? parentId;

/// Create a copy of LocationTrackerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTrackedLocationHistoryDetailCopyWith<_GetTrackedLocationHistoryDetail> get copyWith => __$GetTrackedLocationHistoryDetailCopyWithImpl<_GetTrackedLocationHistoryDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTrackedLocationHistoryDetail&&(identical(other.parentId, parentId) || other.parentId == parentId));
}


@override
int get hashCode => Object.hash(runtimeType,parentId);

@override
String toString() {
  return 'LocationTrackerEvent.getTrackedLocationHistoryDetail(parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class _$GetTrackedLocationHistoryDetailCopyWith<$Res> implements $LocationTrackerEventCopyWith<$Res> {
  factory _$GetTrackedLocationHistoryDetailCopyWith(_GetTrackedLocationHistoryDetail value, $Res Function(_GetTrackedLocationHistoryDetail) _then) = __$GetTrackedLocationHistoryDetailCopyWithImpl;
@useResult
$Res call({
 int? parentId
});




}
/// @nodoc
class __$GetTrackedLocationHistoryDetailCopyWithImpl<$Res>
    implements _$GetTrackedLocationHistoryDetailCopyWith<$Res> {
  __$GetTrackedLocationHistoryDetailCopyWithImpl(this._self, this._then);

  final _GetTrackedLocationHistoryDetail _self;
  final $Res Function(_GetTrackedLocationHistoryDetail) _then;

/// Create a copy of LocationTrackerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? parentId = freezed,}) {
  return _then(_GetTrackedLocationHistoryDetail(
parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _DeleteTrackedLocationHistory implements LocationTrackerEvent {
  const _DeleteTrackedLocationHistory({required this.id});
  

 final  int? id;

/// Create a copy of LocationTrackerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteTrackedLocationHistoryCopyWith<_DeleteTrackedLocationHistory> get copyWith => __$DeleteTrackedLocationHistoryCopyWithImpl<_DeleteTrackedLocationHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTrackedLocationHistory&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'LocationTrackerEvent.deleteTrackedLocationHistory(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteTrackedLocationHistoryCopyWith<$Res> implements $LocationTrackerEventCopyWith<$Res> {
  factory _$DeleteTrackedLocationHistoryCopyWith(_DeleteTrackedLocationHistory value, $Res Function(_DeleteTrackedLocationHistory) _then) = __$DeleteTrackedLocationHistoryCopyWithImpl;
@useResult
$Res call({
 int? id
});




}
/// @nodoc
class __$DeleteTrackedLocationHistoryCopyWithImpl<$Res>
    implements _$DeleteTrackedLocationHistoryCopyWith<$Res> {
  __$DeleteTrackedLocationHistoryCopyWithImpl(this._self, this._then);

  final _DeleteTrackedLocationHistory _self;
  final $Res Function(_DeleteTrackedLocationHistory) _then;

/// Create a copy of LocationTrackerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = freezed,}) {
  return _then(_DeleteTrackedLocationHistory(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _DeleteAllTrackedLocationHistory implements LocationTrackerEvent {
  const _DeleteAllTrackedLocationHistory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteAllTrackedLocationHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationTrackerEvent.deleteAllTrackedLocationHistory()';
}


}




/// @nodoc


class _RestoreLocationTracking implements LocationTrackerEvent {
  const _RestoreLocationTracking();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestoreLocationTracking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationTrackerEvent.restoreLocationTracking()';
}


}




/// @nodoc
mixin _$LocationTrackerState {

 RequestStatus get stateLocationTracking; RequestStatus get stateLocationTrackingByInterval; RequestStatus get stateTrackedLocationHistory; RequestStatus get stateTrackedLocationHistoryDetail; RequestStatus get stateDeleteTrackedLocationHistory; String get errorMessage; int? get activeTrackingId; String? get activeTrackingStartedTime; List<TrackedLocationDataModel> get trackedLocationHistory; List<TrackedLocationDataDetailModel> get trackedLocationHistoryDetail;
/// Create a copy of LocationTrackerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationTrackerStateCopyWith<LocationTrackerState> get copyWith => _$LocationTrackerStateCopyWithImpl<LocationTrackerState>(this as LocationTrackerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationTrackerState&&(identical(other.stateLocationTracking, stateLocationTracking) || other.stateLocationTracking == stateLocationTracking)&&(identical(other.stateLocationTrackingByInterval, stateLocationTrackingByInterval) || other.stateLocationTrackingByInterval == stateLocationTrackingByInterval)&&(identical(other.stateTrackedLocationHistory, stateTrackedLocationHistory) || other.stateTrackedLocationHistory == stateTrackedLocationHistory)&&(identical(other.stateTrackedLocationHistoryDetail, stateTrackedLocationHistoryDetail) || other.stateTrackedLocationHistoryDetail == stateTrackedLocationHistoryDetail)&&(identical(other.stateDeleteTrackedLocationHistory, stateDeleteTrackedLocationHistory) || other.stateDeleteTrackedLocationHistory == stateDeleteTrackedLocationHistory)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.activeTrackingId, activeTrackingId) || other.activeTrackingId == activeTrackingId)&&(identical(other.activeTrackingStartedTime, activeTrackingStartedTime) || other.activeTrackingStartedTime == activeTrackingStartedTime)&&const DeepCollectionEquality().equals(other.trackedLocationHistory, trackedLocationHistory)&&const DeepCollectionEquality().equals(other.trackedLocationHistoryDetail, trackedLocationHistoryDetail));
}


@override
int get hashCode => Object.hash(runtimeType,stateLocationTracking,stateLocationTrackingByInterval,stateTrackedLocationHistory,stateTrackedLocationHistoryDetail,stateDeleteTrackedLocationHistory,errorMessage,activeTrackingId,activeTrackingStartedTime,const DeepCollectionEquality().hash(trackedLocationHistory),const DeepCollectionEquality().hash(trackedLocationHistoryDetail));

@override
String toString() {
  return 'LocationTrackerState(stateLocationTracking: $stateLocationTracking, stateLocationTrackingByInterval: $stateLocationTrackingByInterval, stateTrackedLocationHistory: $stateTrackedLocationHistory, stateTrackedLocationHistoryDetail: $stateTrackedLocationHistoryDetail, stateDeleteTrackedLocationHistory: $stateDeleteTrackedLocationHistory, errorMessage: $errorMessage, activeTrackingId: $activeTrackingId, activeTrackingStartedTime: $activeTrackingStartedTime, trackedLocationHistory: $trackedLocationHistory, trackedLocationHistoryDetail: $trackedLocationHistoryDetail)';
}


}

/// @nodoc
abstract mixin class $LocationTrackerStateCopyWith<$Res>  {
  factory $LocationTrackerStateCopyWith(LocationTrackerState value, $Res Function(LocationTrackerState) _then) = _$LocationTrackerStateCopyWithImpl;
@useResult
$Res call({
 RequestStatus stateLocationTracking, RequestStatus stateLocationTrackingByInterval, RequestStatus stateTrackedLocationHistory, RequestStatus stateTrackedLocationHistoryDetail, RequestStatus stateDeleteTrackedLocationHistory, String errorMessage, int? activeTrackingId, String? activeTrackingStartedTime, List<TrackedLocationDataModel> trackedLocationHistory, List<TrackedLocationDataDetailModel> trackedLocationHistoryDetail
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
@pragma('vm:prefer-inline') @override $Res call({Object? stateLocationTracking = null,Object? stateLocationTrackingByInterval = null,Object? stateTrackedLocationHistory = null,Object? stateTrackedLocationHistoryDetail = null,Object? stateDeleteTrackedLocationHistory = null,Object? errorMessage = null,Object? activeTrackingId = freezed,Object? activeTrackingStartedTime = freezed,Object? trackedLocationHistory = null,Object? trackedLocationHistoryDetail = null,}) {
  return _then(_self.copyWith(
stateLocationTracking: null == stateLocationTracking ? _self.stateLocationTracking : stateLocationTracking // ignore: cast_nullable_to_non_nullable
as RequestStatus,stateLocationTrackingByInterval: null == stateLocationTrackingByInterval ? _self.stateLocationTrackingByInterval : stateLocationTrackingByInterval // ignore: cast_nullable_to_non_nullable
as RequestStatus,stateTrackedLocationHistory: null == stateTrackedLocationHistory ? _self.stateTrackedLocationHistory : stateTrackedLocationHistory // ignore: cast_nullable_to_non_nullable
as RequestStatus,stateTrackedLocationHistoryDetail: null == stateTrackedLocationHistoryDetail ? _self.stateTrackedLocationHistoryDetail : stateTrackedLocationHistoryDetail // ignore: cast_nullable_to_non_nullable
as RequestStatus,stateDeleteTrackedLocationHistory: null == stateDeleteTrackedLocationHistory ? _self.stateDeleteTrackedLocationHistory : stateDeleteTrackedLocationHistory // ignore: cast_nullable_to_non_nullable
as RequestStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,activeTrackingId: freezed == activeTrackingId ? _self.activeTrackingId : activeTrackingId // ignore: cast_nullable_to_non_nullable
as int?,activeTrackingStartedTime: freezed == activeTrackingStartedTime ? _self.activeTrackingStartedTime : activeTrackingStartedTime // ignore: cast_nullable_to_non_nullable
as String?,trackedLocationHistory: null == trackedLocationHistory ? _self.trackedLocationHistory : trackedLocationHistory // ignore: cast_nullable_to_non_nullable
as List<TrackedLocationDataModel>,trackedLocationHistoryDetail: null == trackedLocationHistoryDetail ? _self.trackedLocationHistoryDetail : trackedLocationHistoryDetail // ignore: cast_nullable_to_non_nullable
as List<TrackedLocationDataDetailModel>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequestStatus stateLocationTracking,  RequestStatus stateLocationTrackingByInterval,  RequestStatus stateTrackedLocationHistory,  RequestStatus stateTrackedLocationHistoryDetail,  RequestStatus stateDeleteTrackedLocationHistory,  String errorMessage,  int? activeTrackingId,  String? activeTrackingStartedTime,  List<TrackedLocationDataModel> trackedLocationHistory,  List<TrackedLocationDataDetailModel> trackedLocationHistoryDetail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.stateLocationTracking,_that.stateLocationTrackingByInterval,_that.stateTrackedLocationHistory,_that.stateTrackedLocationHistoryDetail,_that.stateDeleteTrackedLocationHistory,_that.errorMessage,_that.activeTrackingId,_that.activeTrackingStartedTime,_that.trackedLocationHistory,_that.trackedLocationHistoryDetail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequestStatus stateLocationTracking,  RequestStatus stateLocationTrackingByInterval,  RequestStatus stateTrackedLocationHistory,  RequestStatus stateTrackedLocationHistoryDetail,  RequestStatus stateDeleteTrackedLocationHistory,  String errorMessage,  int? activeTrackingId,  String? activeTrackingStartedTime,  List<TrackedLocationDataModel> trackedLocationHistory,  List<TrackedLocationDataDetailModel> trackedLocationHistoryDetail)  $default,) {final _that = this;
switch (_that) {
case _Initial():
return $default(_that.stateLocationTracking,_that.stateLocationTrackingByInterval,_that.stateTrackedLocationHistory,_that.stateTrackedLocationHistoryDetail,_that.stateDeleteTrackedLocationHistory,_that.errorMessage,_that.activeTrackingId,_that.activeTrackingStartedTime,_that.trackedLocationHistory,_that.trackedLocationHistoryDetail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequestStatus stateLocationTracking,  RequestStatus stateLocationTrackingByInterval,  RequestStatus stateTrackedLocationHistory,  RequestStatus stateTrackedLocationHistoryDetail,  RequestStatus stateDeleteTrackedLocationHistory,  String errorMessage,  int? activeTrackingId,  String? activeTrackingStartedTime,  List<TrackedLocationDataModel> trackedLocationHistory,  List<TrackedLocationDataDetailModel> trackedLocationHistoryDetail)?  $default,) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.stateLocationTracking,_that.stateLocationTrackingByInterval,_that.stateTrackedLocationHistory,_that.stateTrackedLocationHistoryDetail,_that.stateDeleteTrackedLocationHistory,_that.errorMessage,_that.activeTrackingId,_that.activeTrackingStartedTime,_that.trackedLocationHistory,_that.trackedLocationHistoryDetail);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LocationTrackerState {
  const _Initial({this.stateLocationTracking = RequestStatus.idle, this.stateLocationTrackingByInterval = RequestStatus.idle, this.stateTrackedLocationHistory = RequestStatus.idle, this.stateTrackedLocationHistoryDetail = RequestStatus.idle, this.stateDeleteTrackedLocationHistory = RequestStatus.idle, this.errorMessage = '', this.activeTrackingId = 0, this.activeTrackingStartedTime = '', final  List<TrackedLocationDataModel> trackedLocationHistory = const [], final  List<TrackedLocationDataDetailModel> trackedLocationHistoryDetail = const []}): _trackedLocationHistory = trackedLocationHistory,_trackedLocationHistoryDetail = trackedLocationHistoryDetail;
  

@override@JsonKey() final  RequestStatus stateLocationTracking;
@override@JsonKey() final  RequestStatus stateLocationTrackingByInterval;
@override@JsonKey() final  RequestStatus stateTrackedLocationHistory;
@override@JsonKey() final  RequestStatus stateTrackedLocationHistoryDetail;
@override@JsonKey() final  RequestStatus stateDeleteTrackedLocationHistory;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  int? activeTrackingId;
@override@JsonKey() final  String? activeTrackingStartedTime;
 final  List<TrackedLocationDataModel> _trackedLocationHistory;
@override@JsonKey() List<TrackedLocationDataModel> get trackedLocationHistory {
  if (_trackedLocationHistory is EqualUnmodifiableListView) return _trackedLocationHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trackedLocationHistory);
}

 final  List<TrackedLocationDataDetailModel> _trackedLocationHistoryDetail;
@override@JsonKey() List<TrackedLocationDataDetailModel> get trackedLocationHistoryDetail {
  if (_trackedLocationHistoryDetail is EqualUnmodifiableListView) return _trackedLocationHistoryDetail;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trackedLocationHistoryDetail);
}


/// Create a copy of LocationTrackerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.stateLocationTracking, stateLocationTracking) || other.stateLocationTracking == stateLocationTracking)&&(identical(other.stateLocationTrackingByInterval, stateLocationTrackingByInterval) || other.stateLocationTrackingByInterval == stateLocationTrackingByInterval)&&(identical(other.stateTrackedLocationHistory, stateTrackedLocationHistory) || other.stateTrackedLocationHistory == stateTrackedLocationHistory)&&(identical(other.stateTrackedLocationHistoryDetail, stateTrackedLocationHistoryDetail) || other.stateTrackedLocationHistoryDetail == stateTrackedLocationHistoryDetail)&&(identical(other.stateDeleteTrackedLocationHistory, stateDeleteTrackedLocationHistory) || other.stateDeleteTrackedLocationHistory == stateDeleteTrackedLocationHistory)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.activeTrackingId, activeTrackingId) || other.activeTrackingId == activeTrackingId)&&(identical(other.activeTrackingStartedTime, activeTrackingStartedTime) || other.activeTrackingStartedTime == activeTrackingStartedTime)&&const DeepCollectionEquality().equals(other._trackedLocationHistory, _trackedLocationHistory)&&const DeepCollectionEquality().equals(other._trackedLocationHistoryDetail, _trackedLocationHistoryDetail));
}


@override
int get hashCode => Object.hash(runtimeType,stateLocationTracking,stateLocationTrackingByInterval,stateTrackedLocationHistory,stateTrackedLocationHistoryDetail,stateDeleteTrackedLocationHistory,errorMessage,activeTrackingId,activeTrackingStartedTime,const DeepCollectionEquality().hash(_trackedLocationHistory),const DeepCollectionEquality().hash(_trackedLocationHistoryDetail));

@override
String toString() {
  return 'LocationTrackerState(stateLocationTracking: $stateLocationTracking, stateLocationTrackingByInterval: $stateLocationTrackingByInterval, stateTrackedLocationHistory: $stateTrackedLocationHistory, stateTrackedLocationHistoryDetail: $stateTrackedLocationHistoryDetail, stateDeleteTrackedLocationHistory: $stateDeleteTrackedLocationHistory, errorMessage: $errorMessage, activeTrackingId: $activeTrackingId, activeTrackingStartedTime: $activeTrackingStartedTime, trackedLocationHistory: $trackedLocationHistory, trackedLocationHistoryDetail: $trackedLocationHistoryDetail)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $LocationTrackerStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 RequestStatus stateLocationTracking, RequestStatus stateLocationTrackingByInterval, RequestStatus stateTrackedLocationHistory, RequestStatus stateTrackedLocationHistoryDetail, RequestStatus stateDeleteTrackedLocationHistory, String errorMessage, int? activeTrackingId, String? activeTrackingStartedTime, List<TrackedLocationDataModel> trackedLocationHistory, List<TrackedLocationDataDetailModel> trackedLocationHistoryDetail
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
@override @pragma('vm:prefer-inline') $Res call({Object? stateLocationTracking = null,Object? stateLocationTrackingByInterval = null,Object? stateTrackedLocationHistory = null,Object? stateTrackedLocationHistoryDetail = null,Object? stateDeleteTrackedLocationHistory = null,Object? errorMessage = null,Object? activeTrackingId = freezed,Object? activeTrackingStartedTime = freezed,Object? trackedLocationHistory = null,Object? trackedLocationHistoryDetail = null,}) {
  return _then(_Initial(
stateLocationTracking: null == stateLocationTracking ? _self.stateLocationTracking : stateLocationTracking // ignore: cast_nullable_to_non_nullable
as RequestStatus,stateLocationTrackingByInterval: null == stateLocationTrackingByInterval ? _self.stateLocationTrackingByInterval : stateLocationTrackingByInterval // ignore: cast_nullable_to_non_nullable
as RequestStatus,stateTrackedLocationHistory: null == stateTrackedLocationHistory ? _self.stateTrackedLocationHistory : stateTrackedLocationHistory // ignore: cast_nullable_to_non_nullable
as RequestStatus,stateTrackedLocationHistoryDetail: null == stateTrackedLocationHistoryDetail ? _self.stateTrackedLocationHistoryDetail : stateTrackedLocationHistoryDetail // ignore: cast_nullable_to_non_nullable
as RequestStatus,stateDeleteTrackedLocationHistory: null == stateDeleteTrackedLocationHistory ? _self.stateDeleteTrackedLocationHistory : stateDeleteTrackedLocationHistory // ignore: cast_nullable_to_non_nullable
as RequestStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,activeTrackingId: freezed == activeTrackingId ? _self.activeTrackingId : activeTrackingId // ignore: cast_nullable_to_non_nullable
as int?,activeTrackingStartedTime: freezed == activeTrackingStartedTime ? _self.activeTrackingStartedTime : activeTrackingStartedTime // ignore: cast_nullable_to_non_nullable
as String?,trackedLocationHistory: null == trackedLocationHistory ? _self._trackedLocationHistory : trackedLocationHistory // ignore: cast_nullable_to_non_nullable
as List<TrackedLocationDataModel>,trackedLocationHistoryDetail: null == trackedLocationHistoryDetail ? _self._trackedLocationHistoryDetail : trackedLocationHistoryDetail // ignore: cast_nullable_to_non_nullable
as List<TrackedLocationDataDetailModel>,
  ));
}


}

// dart format on

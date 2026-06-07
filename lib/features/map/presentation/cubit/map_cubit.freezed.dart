// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapState {

 Loaded<List<MomentEntity>> get moments; bool get isLocating; double? get currentLatitude; double? get currentLongitude;// Tăng mỗi lần lấy vị trí thành công để UI recenter lại dù toạ độ trùng.
 int get focusTick;// Thông báo tạm thời khi không lấy được vị trí (tắt GPS / từ chối quyền).
 String? get locateMessage;
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapStateCopyWith<MapState> get copyWith => _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState&&(identical(other.moments, moments) || other.moments == moments)&&(identical(other.isLocating, isLocating) || other.isLocating == isLocating)&&(identical(other.currentLatitude, currentLatitude) || other.currentLatitude == currentLatitude)&&(identical(other.currentLongitude, currentLongitude) || other.currentLongitude == currentLongitude)&&(identical(other.focusTick, focusTick) || other.focusTick == focusTick)&&(identical(other.locateMessage, locateMessage) || other.locateMessage == locateMessage));
}


@override
int get hashCode => Object.hash(runtimeType,moments,isLocating,currentLatitude,currentLongitude,focusTick,locateMessage);

@override
String toString() {
  return 'MapState(moments: $moments, isLocating: $isLocating, currentLatitude: $currentLatitude, currentLongitude: $currentLongitude, focusTick: $focusTick, locateMessage: $locateMessage)';
}


}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res>  {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) = _$MapStateCopyWithImpl;
@useResult
$Res call({
 Loaded<List<MomentEntity>> moments, bool isLocating, double? currentLatitude, double? currentLongitude, int focusTick, String? locateMessage
});




}
/// @nodoc
class _$MapStateCopyWithImpl<$Res>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? moments = null,Object? isLocating = null,Object? currentLatitude = freezed,Object? currentLongitude = freezed,Object? focusTick = null,Object? locateMessage = freezed,}) {
  return _then(_self.copyWith(
moments: null == moments ? _self.moments : moments // ignore: cast_nullable_to_non_nullable
as Loaded<List<MomentEntity>>,isLocating: null == isLocating ? _self.isLocating : isLocating // ignore: cast_nullable_to_non_nullable
as bool,currentLatitude: freezed == currentLatitude ? _self.currentLatitude : currentLatitude // ignore: cast_nullable_to_non_nullable
as double?,currentLongitude: freezed == currentLongitude ? _self.currentLongitude : currentLongitude // ignore: cast_nullable_to_non_nullable
as double?,focusTick: null == focusTick ? _self.focusTick : focusTick // ignore: cast_nullable_to_non_nullable
as int,locateMessage: freezed == locateMessage ? _self.locateMessage : locateMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapState value)  $default,){
final _that = this;
switch (_that) {
case _MapState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapState value)?  $default,){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Loaded<List<MomentEntity>> moments,  bool isLocating,  double? currentLatitude,  double? currentLongitude,  int focusTick,  String? locateMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.moments,_that.isLocating,_that.currentLatitude,_that.currentLongitude,_that.focusTick,_that.locateMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Loaded<List<MomentEntity>> moments,  bool isLocating,  double? currentLatitude,  double? currentLongitude,  int focusTick,  String? locateMessage)  $default,) {final _that = this;
switch (_that) {
case _MapState():
return $default(_that.moments,_that.isLocating,_that.currentLatitude,_that.currentLongitude,_that.focusTick,_that.locateMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Loaded<List<MomentEntity>> moments,  bool isLocating,  double? currentLatitude,  double? currentLongitude,  int focusTick,  String? locateMessage)?  $default,) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.moments,_that.isLocating,_that.currentLatitude,_that.currentLongitude,_that.focusTick,_that.locateMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MapState implements MapState {
  const _MapState({this.moments = const Loaded<List<MomentEntity>>(), this.isLocating = false, this.currentLatitude, this.currentLongitude, this.focusTick = 0, this.locateMessage});
  

@override@JsonKey() final  Loaded<List<MomentEntity>> moments;
@override@JsonKey() final  bool isLocating;
@override final  double? currentLatitude;
@override final  double? currentLongitude;
// Tăng mỗi lần lấy vị trí thành công để UI recenter lại dù toạ độ trùng.
@override@JsonKey() final  int focusTick;
// Thông báo tạm thời khi không lấy được vị trí (tắt GPS / từ chối quyền).
@override final  String? locateMessage;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapStateCopyWith<_MapState> get copyWith => __$MapStateCopyWithImpl<_MapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapState&&(identical(other.moments, moments) || other.moments == moments)&&(identical(other.isLocating, isLocating) || other.isLocating == isLocating)&&(identical(other.currentLatitude, currentLatitude) || other.currentLatitude == currentLatitude)&&(identical(other.currentLongitude, currentLongitude) || other.currentLongitude == currentLongitude)&&(identical(other.focusTick, focusTick) || other.focusTick == focusTick)&&(identical(other.locateMessage, locateMessage) || other.locateMessage == locateMessage));
}


@override
int get hashCode => Object.hash(runtimeType,moments,isLocating,currentLatitude,currentLongitude,focusTick,locateMessage);

@override
String toString() {
  return 'MapState(moments: $moments, isLocating: $isLocating, currentLatitude: $currentLatitude, currentLongitude: $currentLongitude, focusTick: $focusTick, locateMessage: $locateMessage)';
}


}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) = __$MapStateCopyWithImpl;
@override @useResult
$Res call({
 Loaded<List<MomentEntity>> moments, bool isLocating, double? currentLatitude, double? currentLongitude, int focusTick, String? locateMessage
});




}
/// @nodoc
class __$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? moments = null,Object? isLocating = null,Object? currentLatitude = freezed,Object? currentLongitude = freezed,Object? focusTick = null,Object? locateMessage = freezed,}) {
  return _then(_MapState(
moments: null == moments ? _self.moments : moments // ignore: cast_nullable_to_non_nullable
as Loaded<List<MomentEntity>>,isLocating: null == isLocating ? _self.isLocating : isLocating // ignore: cast_nullable_to_non_nullable
as bool,currentLatitude: freezed == currentLatitude ? _self.currentLatitude : currentLatitude // ignore: cast_nullable_to_non_nullable
as double?,currentLongitude: freezed == currentLongitude ? _self.currentLongitude : currentLongitude // ignore: cast_nullable_to_non_nullable
as double?,focusTick: null == focusTick ? _self.focusTick : focusTick // ignore: cast_nullable_to_non_nullable
as int,locateMessage: freezed == locateMessage ? _self.locateMessage : locateMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

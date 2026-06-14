// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_session_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LockSessionState {

 bool get isUnlocked;
/// Create a copy of LockSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockSessionStateCopyWith<LockSessionState> get copyWith => _$LockSessionStateCopyWithImpl<LockSessionState>(this as LockSessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockSessionState&&(identical(other.isUnlocked, isUnlocked) || other.isUnlocked == isUnlocked));
}


@override
int get hashCode => Object.hash(runtimeType,isUnlocked);

@override
String toString() {
  return 'LockSessionState(isUnlocked: $isUnlocked)';
}


}

/// @nodoc
abstract mixin class $LockSessionStateCopyWith<$Res>  {
  factory $LockSessionStateCopyWith(LockSessionState value, $Res Function(LockSessionState) _then) = _$LockSessionStateCopyWithImpl;
@useResult
$Res call({
 bool isUnlocked
});




}
/// @nodoc
class _$LockSessionStateCopyWithImpl<$Res>
    implements $LockSessionStateCopyWith<$Res> {
  _$LockSessionStateCopyWithImpl(this._self, this._then);

  final LockSessionState _self;
  final $Res Function(LockSessionState) _then;

/// Create a copy of LockSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isUnlocked = null,}) {
  return _then(_self.copyWith(
isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LockSessionState].
extension LockSessionStatePatterns on LockSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockSessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockSessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockSessionState value)  $default,){
final _that = this;
switch (_that) {
case _LockSessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockSessionState value)?  $default,){
final _that = this;
switch (_that) {
case _LockSessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isUnlocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockSessionState() when $default != null:
return $default(_that.isUnlocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isUnlocked)  $default,) {final _that = this;
switch (_that) {
case _LockSessionState():
return $default(_that.isUnlocked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isUnlocked)?  $default,) {final _that = this;
switch (_that) {
case _LockSessionState() when $default != null:
return $default(_that.isUnlocked);case _:
  return null;

}
}

}

/// @nodoc


class _LockSessionState implements LockSessionState {
  const _LockSessionState({this.isUnlocked = false});
  

@override@JsonKey() final  bool isUnlocked;

/// Create a copy of LockSessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockSessionStateCopyWith<_LockSessionState> get copyWith => __$LockSessionStateCopyWithImpl<_LockSessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockSessionState&&(identical(other.isUnlocked, isUnlocked) || other.isUnlocked == isUnlocked));
}


@override
int get hashCode => Object.hash(runtimeType,isUnlocked);

@override
String toString() {
  return 'LockSessionState(isUnlocked: $isUnlocked)';
}


}

/// @nodoc
abstract mixin class _$LockSessionStateCopyWith<$Res> implements $LockSessionStateCopyWith<$Res> {
  factory _$LockSessionStateCopyWith(_LockSessionState value, $Res Function(_LockSessionState) _then) = __$LockSessionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isUnlocked
});




}
/// @nodoc
class __$LockSessionStateCopyWithImpl<$Res>
    implements _$LockSessionStateCopyWith<$Res> {
  __$LockSessionStateCopyWithImpl(this._self, this._then);

  final _LockSessionState _self;
  final $Res Function(_LockSessionState) _then;

/// Create a copy of LockSessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isUnlocked = null,}) {
  return _then(_LockSessionState(
isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

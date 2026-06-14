// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PinState {

 PinStage get stage;/// Current digits typed for the active field.
 String get input;/// First entry captured while waiting for confirmation.
 String get firstEntry;/// User-facing error message (wrong PIN, mismatch, lockout, ...).
 String? get error;/// Remaining lockout time; counts down via [PinCubit.refreshLockout].
 Duration get lockoutRemaining;/// Recovery code to display once after a successful setup.
 String? get recoveryCode;/// True while an async verify/set is in flight.
 bool get busy;
/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinStateCopyWith<PinState> get copyWith => _$PinStateCopyWithImpl<PinState>(this as PinState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinState&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.input, input) || other.input == input)&&(identical(other.firstEntry, firstEntry) || other.firstEntry == firstEntry)&&(identical(other.error, error) || other.error == error)&&(identical(other.lockoutRemaining, lockoutRemaining) || other.lockoutRemaining == lockoutRemaining)&&(identical(other.recoveryCode, recoveryCode) || other.recoveryCode == recoveryCode)&&(identical(other.busy, busy) || other.busy == busy));
}


@override
int get hashCode => Object.hash(runtimeType,stage,input,firstEntry,error,lockoutRemaining,recoveryCode,busy);

@override
String toString() {
  return 'PinState(stage: $stage, input: $input, firstEntry: $firstEntry, error: $error, lockoutRemaining: $lockoutRemaining, recoveryCode: $recoveryCode, busy: $busy)';
}


}

/// @nodoc
abstract mixin class $PinStateCopyWith<$Res>  {
  factory $PinStateCopyWith(PinState value, $Res Function(PinState) _then) = _$PinStateCopyWithImpl;
@useResult
$Res call({
 PinStage stage, String input, String firstEntry, String? error, Duration lockoutRemaining, String? recoveryCode, bool busy
});




}
/// @nodoc
class _$PinStateCopyWithImpl<$Res>
    implements $PinStateCopyWith<$Res> {
  _$PinStateCopyWithImpl(this._self, this._then);

  final PinState _self;
  final $Res Function(PinState) _then;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stage = null,Object? input = null,Object? firstEntry = null,Object? error = freezed,Object? lockoutRemaining = null,Object? recoveryCode = freezed,Object? busy = null,}) {
  return _then(_self.copyWith(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as PinStage,input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as String,firstEntry: null == firstEntry ? _self.firstEntry : firstEntry // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,lockoutRemaining: null == lockoutRemaining ? _self.lockoutRemaining : lockoutRemaining // ignore: cast_nullable_to_non_nullable
as Duration,recoveryCode: freezed == recoveryCode ? _self.recoveryCode : recoveryCode // ignore: cast_nullable_to_non_nullable
as String?,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PinState].
extension PinStatePatterns on PinState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PinState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PinState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PinState value)  $default,){
final _that = this;
switch (_that) {
case _PinState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PinState value)?  $default,){
final _that = this;
switch (_that) {
case _PinState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PinStage stage,  String input,  String firstEntry,  String? error,  Duration lockoutRemaining,  String? recoveryCode,  bool busy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PinState() when $default != null:
return $default(_that.stage,_that.input,_that.firstEntry,_that.error,_that.lockoutRemaining,_that.recoveryCode,_that.busy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PinStage stage,  String input,  String firstEntry,  String? error,  Duration lockoutRemaining,  String? recoveryCode,  bool busy)  $default,) {final _that = this;
switch (_that) {
case _PinState():
return $default(_that.stage,_that.input,_that.firstEntry,_that.error,_that.lockoutRemaining,_that.recoveryCode,_that.busy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PinStage stage,  String input,  String firstEntry,  String? error,  Duration lockoutRemaining,  String? recoveryCode,  bool busy)?  $default,) {final _that = this;
switch (_that) {
case _PinState() when $default != null:
return $default(_that.stage,_that.input,_that.firstEntry,_that.error,_that.lockoutRemaining,_that.recoveryCode,_that.busy);case _:
  return null;

}
}

}

/// @nodoc


class _PinState extends PinState {
  const _PinState({this.stage = PinStage.enter, this.input = '', this.firstEntry = '', this.error, this.lockoutRemaining = Duration.zero, this.recoveryCode, this.busy = false}): super._();
  

@override@JsonKey() final  PinStage stage;
/// Current digits typed for the active field.
@override@JsonKey() final  String input;
/// First entry captured while waiting for confirmation.
@override@JsonKey() final  String firstEntry;
/// User-facing error message (wrong PIN, mismatch, lockout, ...).
@override final  String? error;
/// Remaining lockout time; counts down via [PinCubit.refreshLockout].
@override@JsonKey() final  Duration lockoutRemaining;
/// Recovery code to display once after a successful setup.
@override final  String? recoveryCode;
/// True while an async verify/set is in flight.
@override@JsonKey() final  bool busy;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PinStateCopyWith<_PinState> get copyWith => __$PinStateCopyWithImpl<_PinState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PinState&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.input, input) || other.input == input)&&(identical(other.firstEntry, firstEntry) || other.firstEntry == firstEntry)&&(identical(other.error, error) || other.error == error)&&(identical(other.lockoutRemaining, lockoutRemaining) || other.lockoutRemaining == lockoutRemaining)&&(identical(other.recoveryCode, recoveryCode) || other.recoveryCode == recoveryCode)&&(identical(other.busy, busy) || other.busy == busy));
}


@override
int get hashCode => Object.hash(runtimeType,stage,input,firstEntry,error,lockoutRemaining,recoveryCode,busy);

@override
String toString() {
  return 'PinState(stage: $stage, input: $input, firstEntry: $firstEntry, error: $error, lockoutRemaining: $lockoutRemaining, recoveryCode: $recoveryCode, busy: $busy)';
}


}

/// @nodoc
abstract mixin class _$PinStateCopyWith<$Res> implements $PinStateCopyWith<$Res> {
  factory _$PinStateCopyWith(_PinState value, $Res Function(_PinState) _then) = __$PinStateCopyWithImpl;
@override @useResult
$Res call({
 PinStage stage, String input, String firstEntry, String? error, Duration lockoutRemaining, String? recoveryCode, bool busy
});




}
/// @nodoc
class __$PinStateCopyWithImpl<$Res>
    implements _$PinStateCopyWith<$Res> {
  __$PinStateCopyWithImpl(this._self, this._then);

  final _PinState _self;
  final $Res Function(_PinState) _then;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stage = null,Object? input = null,Object? firstEntry = null,Object? error = freezed,Object? lockoutRemaining = null,Object? recoveryCode = freezed,Object? busy = null,}) {
  return _then(_PinState(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as PinStage,input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as String,firstEntry: null == firstEntry ? _self.firstEntry : firstEntry // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,lockoutRemaining: null == lockoutRemaining ? _self.lockoutRemaining : lockoutRemaining // ignore: cast_nullable_to_non_nullable
as Duration,recoveryCode: freezed == recoveryCode ? _self.recoveryCode : recoveryCode // ignore: cast_nullable_to_non_nullable
as String?,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

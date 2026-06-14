// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimelineState {

 Loaded<List<MomentSummary>> get moments;
/// Create a copy of TimelineState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineStateCopyWith<TimelineState> get copyWith => _$TimelineStateCopyWithImpl<TimelineState>(this as TimelineState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineState&&(identical(other.moments, moments) || other.moments == moments));
}


@override
int get hashCode => Object.hash(runtimeType,moments);

@override
String toString() {
  return 'TimelineState(moments: $moments)';
}


}

/// @nodoc
abstract mixin class $TimelineStateCopyWith<$Res>  {
  factory $TimelineStateCopyWith(TimelineState value, $Res Function(TimelineState) _then) = _$TimelineStateCopyWithImpl;
@useResult
$Res call({
 Loaded<List<MomentSummary>> moments
});




}
/// @nodoc
class _$TimelineStateCopyWithImpl<$Res>
    implements $TimelineStateCopyWith<$Res> {
  _$TimelineStateCopyWithImpl(this._self, this._then);

  final TimelineState _self;
  final $Res Function(TimelineState) _then;

/// Create a copy of TimelineState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? moments = null,}) {
  return _then(_self.copyWith(
moments: null == moments ? _self.moments : moments // ignore: cast_nullable_to_non_nullable
as Loaded<List<MomentSummary>>,
  ));
}

}


/// Adds pattern-matching-related methods to [TimelineState].
extension TimelineStatePatterns on TimelineState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimelineState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimelineState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimelineState value)  $default,){
final _that = this;
switch (_that) {
case _TimelineState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimelineState value)?  $default,){
final _that = this;
switch (_that) {
case _TimelineState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Loaded<List<MomentSummary>> moments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimelineState() when $default != null:
return $default(_that.moments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Loaded<List<MomentSummary>> moments)  $default,) {final _that = this;
switch (_that) {
case _TimelineState():
return $default(_that.moments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Loaded<List<MomentSummary>> moments)?  $default,) {final _that = this;
switch (_that) {
case _TimelineState() when $default != null:
return $default(_that.moments);case _:
  return null;

}
}

}

/// @nodoc


class _TimelineState implements TimelineState {
  const _TimelineState({this.moments = const Loaded<List<MomentSummary>>()});
  

@override@JsonKey() final  Loaded<List<MomentSummary>> moments;

/// Create a copy of TimelineState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineStateCopyWith<_TimelineState> get copyWith => __$TimelineStateCopyWithImpl<_TimelineState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelineState&&(identical(other.moments, moments) || other.moments == moments));
}


@override
int get hashCode => Object.hash(runtimeType,moments);

@override
String toString() {
  return 'TimelineState(moments: $moments)';
}


}

/// @nodoc
abstract mixin class _$TimelineStateCopyWith<$Res> implements $TimelineStateCopyWith<$Res> {
  factory _$TimelineStateCopyWith(_TimelineState value, $Res Function(_TimelineState) _then) = __$TimelineStateCopyWithImpl;
@override @useResult
$Res call({
 Loaded<List<MomentSummary>> moments
});




}
/// @nodoc
class __$TimelineStateCopyWithImpl<$Res>
    implements _$TimelineStateCopyWith<$Res> {
  __$TimelineStateCopyWithImpl(this._self, this._then);

  final _TimelineState _self;
  final $Res Function(_TimelineState) _then;

/// Create a copy of TimelineState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? moments = null,}) {
  return _then(_TimelineState(
moments: null == moments ? _self.moments : moments // ignore: cast_nullable_to_non_nullable
as Loaded<List<MomentSummary>>,
  ));
}


}

// dart format on

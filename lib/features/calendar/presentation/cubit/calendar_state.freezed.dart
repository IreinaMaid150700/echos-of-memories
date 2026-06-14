// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarState {

 DateTime? get selectedDay; DateTime? get focusedDay; Loaded<List<MomentSummary>> get momentsForSelectedDay; CalendarFormat get calendarFormat;
/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarStateCopyWith<CalendarState> get copyWith => _$CalendarStateCopyWithImpl<CalendarState>(this as CalendarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarState&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay)&&(identical(other.momentsForSelectedDay, momentsForSelectedDay) || other.momentsForSelectedDay == momentsForSelectedDay)&&(identical(other.calendarFormat, calendarFormat) || other.calendarFormat == calendarFormat));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDay,focusedDay,momentsForSelectedDay,calendarFormat);

@override
String toString() {
  return 'CalendarState(selectedDay: $selectedDay, focusedDay: $focusedDay, momentsForSelectedDay: $momentsForSelectedDay, calendarFormat: $calendarFormat)';
}


}

/// @nodoc
abstract mixin class $CalendarStateCopyWith<$Res>  {
  factory $CalendarStateCopyWith(CalendarState value, $Res Function(CalendarState) _then) = _$CalendarStateCopyWithImpl;
@useResult
$Res call({
 DateTime? selectedDay, DateTime? focusedDay, Loaded<List<MomentSummary>> momentsForSelectedDay, CalendarFormat calendarFormat
});




}
/// @nodoc
class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._self, this._then);

  final CalendarState _self;
  final $Res Function(CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDay = freezed,Object? focusedDay = freezed,Object? momentsForSelectedDay = null,Object? calendarFormat = null,}) {
  return _then(_self.copyWith(
selectedDay: freezed == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime?,focusedDay: freezed == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime?,momentsForSelectedDay: null == momentsForSelectedDay ? _self.momentsForSelectedDay : momentsForSelectedDay // ignore: cast_nullable_to_non_nullable
as Loaded<List<MomentSummary>>,calendarFormat: null == calendarFormat ? _self.calendarFormat : calendarFormat // ignore: cast_nullable_to_non_nullable
as CalendarFormat,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarState].
extension CalendarStatePatterns on CalendarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarState value)  $default,){
final _that = this;
switch (_that) {
case _CalendarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarState value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? selectedDay,  DateTime? focusedDay,  Loaded<List<MomentSummary>> momentsForSelectedDay,  CalendarFormat calendarFormat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.selectedDay,_that.focusedDay,_that.momentsForSelectedDay,_that.calendarFormat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? selectedDay,  DateTime? focusedDay,  Loaded<List<MomentSummary>> momentsForSelectedDay,  CalendarFormat calendarFormat)  $default,) {final _that = this;
switch (_that) {
case _CalendarState():
return $default(_that.selectedDay,_that.focusedDay,_that.momentsForSelectedDay,_that.calendarFormat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? selectedDay,  DateTime? focusedDay,  Loaded<List<MomentSummary>> momentsForSelectedDay,  CalendarFormat calendarFormat)?  $default,) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.selectedDay,_that.focusedDay,_that.momentsForSelectedDay,_that.calendarFormat);case _:
  return null;

}
}

}

/// @nodoc


class _CalendarState implements CalendarState {
  const _CalendarState({this.selectedDay, this.focusedDay, this.momentsForSelectedDay = const Loaded<List<MomentSummary>>(), this.calendarFormat = CalendarFormat.month});
  

@override final  DateTime? selectedDay;
@override final  DateTime? focusedDay;
@override@JsonKey() final  Loaded<List<MomentSummary>> momentsForSelectedDay;
@override@JsonKey() final  CalendarFormat calendarFormat;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarStateCopyWith<_CalendarState> get copyWith => __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarState&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay)&&(identical(other.momentsForSelectedDay, momentsForSelectedDay) || other.momentsForSelectedDay == momentsForSelectedDay)&&(identical(other.calendarFormat, calendarFormat) || other.calendarFormat == calendarFormat));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDay,focusedDay,momentsForSelectedDay,calendarFormat);

@override
String toString() {
  return 'CalendarState(selectedDay: $selectedDay, focusedDay: $focusedDay, momentsForSelectedDay: $momentsForSelectedDay, calendarFormat: $calendarFormat)';
}


}

/// @nodoc
abstract mixin class _$CalendarStateCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(_CalendarState value, $Res Function(_CalendarState) _then) = __$CalendarStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime? selectedDay, DateTime? focusedDay, Loaded<List<MomentSummary>> momentsForSelectedDay, CalendarFormat calendarFormat
});




}
/// @nodoc
class __$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(this._self, this._then);

  final _CalendarState _self;
  final $Res Function(_CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDay = freezed,Object? focusedDay = freezed,Object? momentsForSelectedDay = null,Object? calendarFormat = null,}) {
  return _then(_CalendarState(
selectedDay: freezed == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime?,focusedDay: freezed == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime?,momentsForSelectedDay: null == momentsForSelectedDay ? _self.momentsForSelectedDay : momentsForSelectedDay // ignore: cast_nullable_to_non_nullable
as Loaded<List<MomentSummary>>,calendarFormat: null == calendarFormat ? _self.calendarFormat : calendarFormat // ignore: cast_nullable_to_non_nullable
as CalendarFormat,
  ));
}


}

// dart format on

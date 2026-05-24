// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_moment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateMomentState {

 CreateMomentDirectEnum? get createMomentDirectEnum; List<File> get imagePicker; String? get note; DateTime? get momentDate; List<String> get tagsIdSelect; String? get toneIdSelected; bool get hideFromWidget; bool get isLockMoment; bool get isLoved; int get timeStamp;
/// Create a copy of CreateMomentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateMomentStateCopyWith<CreateMomentState> get copyWith => _$CreateMomentStateCopyWithImpl<CreateMomentState>(this as CreateMomentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMomentState&&(identical(other.createMomentDirectEnum, createMomentDirectEnum) || other.createMomentDirectEnum == createMomentDirectEnum)&&const DeepCollectionEquality().equals(other.imagePicker, imagePicker)&&(identical(other.note, note) || other.note == note)&&(identical(other.momentDate, momentDate) || other.momentDate == momentDate)&&const DeepCollectionEquality().equals(other.tagsIdSelect, tagsIdSelect)&&(identical(other.toneIdSelected, toneIdSelected) || other.toneIdSelected == toneIdSelected)&&(identical(other.hideFromWidget, hideFromWidget) || other.hideFromWidget == hideFromWidget)&&(identical(other.isLockMoment, isLockMoment) || other.isLockMoment == isLockMoment)&&(identical(other.isLoved, isLoved) || other.isLoved == isLoved)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}


@override
int get hashCode => Object.hash(runtimeType,createMomentDirectEnum,const DeepCollectionEquality().hash(imagePicker),note,momentDate,const DeepCollectionEquality().hash(tagsIdSelect),toneIdSelected,hideFromWidget,isLockMoment,isLoved,timeStamp);

@override
String toString() {
  return 'CreateMomentState(createMomentDirectEnum: $createMomentDirectEnum, imagePicker: $imagePicker, note: $note, momentDate: $momentDate, tagsIdSelect: $tagsIdSelect, toneIdSelected: $toneIdSelected, hideFromWidget: $hideFromWidget, isLockMoment: $isLockMoment, isLoved: $isLoved, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class $CreateMomentStateCopyWith<$Res>  {
  factory $CreateMomentStateCopyWith(CreateMomentState value, $Res Function(CreateMomentState) _then) = _$CreateMomentStateCopyWithImpl;
@useResult
$Res call({
 CreateMomentDirectEnum? createMomentDirectEnum, List<File> imagePicker, String? note, DateTime? momentDate, List<String> tagsIdSelect, String? toneIdSelected, bool hideFromWidget, bool isLockMoment, bool isLoved, int timeStamp
});




}
/// @nodoc
class _$CreateMomentStateCopyWithImpl<$Res>
    implements $CreateMomentStateCopyWith<$Res> {
  _$CreateMomentStateCopyWithImpl(this._self, this._then);

  final CreateMomentState _self;
  final $Res Function(CreateMomentState) _then;

/// Create a copy of CreateMomentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createMomentDirectEnum = freezed,Object? imagePicker = null,Object? note = freezed,Object? momentDate = freezed,Object? tagsIdSelect = null,Object? toneIdSelected = freezed,Object? hideFromWidget = null,Object? isLockMoment = null,Object? isLoved = null,Object? timeStamp = null,}) {
  return _then(_self.copyWith(
createMomentDirectEnum: freezed == createMomentDirectEnum ? _self.createMomentDirectEnum : createMomentDirectEnum // ignore: cast_nullable_to_non_nullable
as CreateMomentDirectEnum?,imagePicker: null == imagePicker ? _self.imagePicker : imagePicker // ignore: cast_nullable_to_non_nullable
as List<File>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,momentDate: freezed == momentDate ? _self.momentDate : momentDate // ignore: cast_nullable_to_non_nullable
as DateTime?,tagsIdSelect: null == tagsIdSelect ? _self.tagsIdSelect : tagsIdSelect // ignore: cast_nullable_to_non_nullable
as List<String>,toneIdSelected: freezed == toneIdSelected ? _self.toneIdSelected : toneIdSelected // ignore: cast_nullable_to_non_nullable
as String?,hideFromWidget: null == hideFromWidget ? _self.hideFromWidget : hideFromWidget // ignore: cast_nullable_to_non_nullable
as bool,isLockMoment: null == isLockMoment ? _self.isLockMoment : isLockMoment // ignore: cast_nullable_to_non_nullable
as bool,isLoved: null == isLoved ? _self.isLoved : isLoved // ignore: cast_nullable_to_non_nullable
as bool,timeStamp: null == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateMomentState].
extension CreateMomentStatePatterns on CreateMomentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateMomentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateMomentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateMomentState value)  $default,){
final _that = this;
switch (_that) {
case _CreateMomentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateMomentState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateMomentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateMomentDirectEnum? createMomentDirectEnum,  List<File> imagePicker,  String? note,  DateTime? momentDate,  List<String> tagsIdSelect,  String? toneIdSelected,  bool hideFromWidget,  bool isLockMoment,  bool isLoved,  int timeStamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateMomentState() when $default != null:
return $default(_that.createMomentDirectEnum,_that.imagePicker,_that.note,_that.momentDate,_that.tagsIdSelect,_that.toneIdSelected,_that.hideFromWidget,_that.isLockMoment,_that.isLoved,_that.timeStamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateMomentDirectEnum? createMomentDirectEnum,  List<File> imagePicker,  String? note,  DateTime? momentDate,  List<String> tagsIdSelect,  String? toneIdSelected,  bool hideFromWidget,  bool isLockMoment,  bool isLoved,  int timeStamp)  $default,) {final _that = this;
switch (_that) {
case _CreateMomentState():
return $default(_that.createMomentDirectEnum,_that.imagePicker,_that.note,_that.momentDate,_that.tagsIdSelect,_that.toneIdSelected,_that.hideFromWidget,_that.isLockMoment,_that.isLoved,_that.timeStamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateMomentDirectEnum? createMomentDirectEnum,  List<File> imagePicker,  String? note,  DateTime? momentDate,  List<String> tagsIdSelect,  String? toneIdSelected,  bool hideFromWidget,  bool isLockMoment,  bool isLoved,  int timeStamp)?  $default,) {final _that = this;
switch (_that) {
case _CreateMomentState() when $default != null:
return $default(_that.createMomentDirectEnum,_that.imagePicker,_that.note,_that.momentDate,_that.tagsIdSelect,_that.toneIdSelected,_that.hideFromWidget,_that.isLockMoment,_that.isLoved,_that.timeStamp);case _:
  return null;

}
}

}

/// @nodoc


class _CreateMomentState implements CreateMomentState {
  const _CreateMomentState({this.createMomentDirectEnum, final  List<File> imagePicker = const [], this.note, this.momentDate, final  List<String> tagsIdSelect = const [], this.toneIdSelected, this.hideFromWidget = false, this.isLockMoment = false, this.isLoved = false, this.timeStamp = 0}): _imagePicker = imagePicker,_tagsIdSelect = tagsIdSelect;
  

@override final  CreateMomentDirectEnum? createMomentDirectEnum;
 final  List<File> _imagePicker;
@override@JsonKey() List<File> get imagePicker {
  if (_imagePicker is EqualUnmodifiableListView) return _imagePicker;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imagePicker);
}

@override final  String? note;
@override final  DateTime? momentDate;
 final  List<String> _tagsIdSelect;
@override@JsonKey() List<String> get tagsIdSelect {
  if (_tagsIdSelect is EqualUnmodifiableListView) return _tagsIdSelect;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tagsIdSelect);
}

@override final  String? toneIdSelected;
@override@JsonKey() final  bool hideFromWidget;
@override@JsonKey() final  bool isLockMoment;
@override@JsonKey() final  bool isLoved;
@override@JsonKey() final  int timeStamp;

/// Create a copy of CreateMomentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMomentStateCopyWith<_CreateMomentState> get copyWith => __$CreateMomentStateCopyWithImpl<_CreateMomentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMomentState&&(identical(other.createMomentDirectEnum, createMomentDirectEnum) || other.createMomentDirectEnum == createMomentDirectEnum)&&const DeepCollectionEquality().equals(other._imagePicker, _imagePicker)&&(identical(other.note, note) || other.note == note)&&(identical(other.momentDate, momentDate) || other.momentDate == momentDate)&&const DeepCollectionEquality().equals(other._tagsIdSelect, _tagsIdSelect)&&(identical(other.toneIdSelected, toneIdSelected) || other.toneIdSelected == toneIdSelected)&&(identical(other.hideFromWidget, hideFromWidget) || other.hideFromWidget == hideFromWidget)&&(identical(other.isLockMoment, isLockMoment) || other.isLockMoment == isLockMoment)&&(identical(other.isLoved, isLoved) || other.isLoved == isLoved)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}


@override
int get hashCode => Object.hash(runtimeType,createMomentDirectEnum,const DeepCollectionEquality().hash(_imagePicker),note,momentDate,const DeepCollectionEquality().hash(_tagsIdSelect),toneIdSelected,hideFromWidget,isLockMoment,isLoved,timeStamp);

@override
String toString() {
  return 'CreateMomentState(createMomentDirectEnum: $createMomentDirectEnum, imagePicker: $imagePicker, note: $note, momentDate: $momentDate, tagsIdSelect: $tagsIdSelect, toneIdSelected: $toneIdSelected, hideFromWidget: $hideFromWidget, isLockMoment: $isLockMoment, isLoved: $isLoved, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class _$CreateMomentStateCopyWith<$Res> implements $CreateMomentStateCopyWith<$Res> {
  factory _$CreateMomentStateCopyWith(_CreateMomentState value, $Res Function(_CreateMomentState) _then) = __$CreateMomentStateCopyWithImpl;
@override @useResult
$Res call({
 CreateMomentDirectEnum? createMomentDirectEnum, List<File> imagePicker, String? note, DateTime? momentDate, List<String> tagsIdSelect, String? toneIdSelected, bool hideFromWidget, bool isLockMoment, bool isLoved, int timeStamp
});




}
/// @nodoc
class __$CreateMomentStateCopyWithImpl<$Res>
    implements _$CreateMomentStateCopyWith<$Res> {
  __$CreateMomentStateCopyWithImpl(this._self, this._then);

  final _CreateMomentState _self;
  final $Res Function(_CreateMomentState) _then;

/// Create a copy of CreateMomentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createMomentDirectEnum = freezed,Object? imagePicker = null,Object? note = freezed,Object? momentDate = freezed,Object? tagsIdSelect = null,Object? toneIdSelected = freezed,Object? hideFromWidget = null,Object? isLockMoment = null,Object? isLoved = null,Object? timeStamp = null,}) {
  return _then(_CreateMomentState(
createMomentDirectEnum: freezed == createMomentDirectEnum ? _self.createMomentDirectEnum : createMomentDirectEnum // ignore: cast_nullable_to_non_nullable
as CreateMomentDirectEnum?,imagePicker: null == imagePicker ? _self._imagePicker : imagePicker // ignore: cast_nullable_to_non_nullable
as List<File>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,momentDate: freezed == momentDate ? _self.momentDate : momentDate // ignore: cast_nullable_to_non_nullable
as DateTime?,tagsIdSelect: null == tagsIdSelect ? _self._tagsIdSelect : tagsIdSelect // ignore: cast_nullable_to_non_nullable
as List<String>,toneIdSelected: freezed == toneIdSelected ? _self.toneIdSelected : toneIdSelected // ignore: cast_nullable_to_non_nullable
as String?,hideFromWidget: null == hideFromWidget ? _self.hideFromWidget : hideFromWidget // ignore: cast_nullable_to_non_nullable
as bool,isLockMoment: null == isLockMoment ? _self.isLockMoment : isLockMoment // ignore: cast_nullable_to_non_nullable
as bool,isLoved: null == isLoved ? _self.isLoved : isLoved // ignore: cast_nullable_to_non_nullable
as bool,timeStamp: null == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moment_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MomentDetailState {

 bool get showDeleteConfirm; bool get isEnablePinOnTop; bool get isHideFromWidget; Loaded<MomentEntity> get moment; Loaded<Unit> get deleteAction;
/// Create a copy of MomentDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MomentDetailStateCopyWith<MomentDetailState> get copyWith => _$MomentDetailStateCopyWithImpl<MomentDetailState>(this as MomentDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MomentDetailState&&(identical(other.showDeleteConfirm, showDeleteConfirm) || other.showDeleteConfirm == showDeleteConfirm)&&(identical(other.isEnablePinOnTop, isEnablePinOnTop) || other.isEnablePinOnTop == isEnablePinOnTop)&&(identical(other.isHideFromWidget, isHideFromWidget) || other.isHideFromWidget == isHideFromWidget)&&(identical(other.moment, moment) || other.moment == moment)&&(identical(other.deleteAction, deleteAction) || other.deleteAction == deleteAction));
}


@override
int get hashCode => Object.hash(runtimeType,showDeleteConfirm,isEnablePinOnTop,isHideFromWidget,moment,deleteAction);

@override
String toString() {
  return 'MomentDetailState(showDeleteConfirm: $showDeleteConfirm, isEnablePinOnTop: $isEnablePinOnTop, isHideFromWidget: $isHideFromWidget, moment: $moment, deleteAction: $deleteAction)';
}


}

/// @nodoc
abstract mixin class $MomentDetailStateCopyWith<$Res>  {
  factory $MomentDetailStateCopyWith(MomentDetailState value, $Res Function(MomentDetailState) _then) = _$MomentDetailStateCopyWithImpl;
@useResult
$Res call({
 bool showDeleteConfirm, bool isEnablePinOnTop, bool isHideFromWidget, Loaded<MomentEntity> moment, Loaded<Unit> deleteAction
});




}
/// @nodoc
class _$MomentDetailStateCopyWithImpl<$Res>
    implements $MomentDetailStateCopyWith<$Res> {
  _$MomentDetailStateCopyWithImpl(this._self, this._then);

  final MomentDetailState _self;
  final $Res Function(MomentDetailState) _then;

/// Create a copy of MomentDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showDeleteConfirm = null,Object? isEnablePinOnTop = null,Object? isHideFromWidget = null,Object? moment = null,Object? deleteAction = null,}) {
  return _then(_self.copyWith(
showDeleteConfirm: null == showDeleteConfirm ? _self.showDeleteConfirm : showDeleteConfirm // ignore: cast_nullable_to_non_nullable
as bool,isEnablePinOnTop: null == isEnablePinOnTop ? _self.isEnablePinOnTop : isEnablePinOnTop // ignore: cast_nullable_to_non_nullable
as bool,isHideFromWidget: null == isHideFromWidget ? _self.isHideFromWidget : isHideFromWidget // ignore: cast_nullable_to_non_nullable
as bool,moment: null == moment ? _self.moment : moment // ignore: cast_nullable_to_non_nullable
as Loaded<MomentEntity>,deleteAction: null == deleteAction ? _self.deleteAction : deleteAction // ignore: cast_nullable_to_non_nullable
as Loaded<Unit>,
  ));
}

}


/// Adds pattern-matching-related methods to [MomentDetailState].
extension MomentDetailStatePatterns on MomentDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MomentDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MomentDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MomentDetailState value)  $default,){
final _that = this;
switch (_that) {
case _MomentDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MomentDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _MomentDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showDeleteConfirm,  bool isEnablePinOnTop,  bool isHideFromWidget,  Loaded<MomentEntity> moment,  Loaded<Unit> deleteAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MomentDetailState() when $default != null:
return $default(_that.showDeleteConfirm,_that.isEnablePinOnTop,_that.isHideFromWidget,_that.moment,_that.deleteAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showDeleteConfirm,  bool isEnablePinOnTop,  bool isHideFromWidget,  Loaded<MomentEntity> moment,  Loaded<Unit> deleteAction)  $default,) {final _that = this;
switch (_that) {
case _MomentDetailState():
return $default(_that.showDeleteConfirm,_that.isEnablePinOnTop,_that.isHideFromWidget,_that.moment,_that.deleteAction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showDeleteConfirm,  bool isEnablePinOnTop,  bool isHideFromWidget,  Loaded<MomentEntity> moment,  Loaded<Unit> deleteAction)?  $default,) {final _that = this;
switch (_that) {
case _MomentDetailState() when $default != null:
return $default(_that.showDeleteConfirm,_that.isEnablePinOnTop,_that.isHideFromWidget,_that.moment,_that.deleteAction);case _:
  return null;

}
}

}

/// @nodoc


class _MomentDetailState implements MomentDetailState {
  const _MomentDetailState({this.showDeleteConfirm = false, this.isEnablePinOnTop = false, this.isHideFromWidget = false, this.moment = const Loaded<MomentEntity>(), this.deleteAction = const Loaded<Unit>()});
  

@override@JsonKey() final  bool showDeleteConfirm;
@override@JsonKey() final  bool isEnablePinOnTop;
@override@JsonKey() final  bool isHideFromWidget;
@override@JsonKey() final  Loaded<MomentEntity> moment;
@override@JsonKey() final  Loaded<Unit> deleteAction;

/// Create a copy of MomentDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MomentDetailStateCopyWith<_MomentDetailState> get copyWith => __$MomentDetailStateCopyWithImpl<_MomentDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MomentDetailState&&(identical(other.showDeleteConfirm, showDeleteConfirm) || other.showDeleteConfirm == showDeleteConfirm)&&(identical(other.isEnablePinOnTop, isEnablePinOnTop) || other.isEnablePinOnTop == isEnablePinOnTop)&&(identical(other.isHideFromWidget, isHideFromWidget) || other.isHideFromWidget == isHideFromWidget)&&(identical(other.moment, moment) || other.moment == moment)&&(identical(other.deleteAction, deleteAction) || other.deleteAction == deleteAction));
}


@override
int get hashCode => Object.hash(runtimeType,showDeleteConfirm,isEnablePinOnTop,isHideFromWidget,moment,deleteAction);

@override
String toString() {
  return 'MomentDetailState(showDeleteConfirm: $showDeleteConfirm, isEnablePinOnTop: $isEnablePinOnTop, isHideFromWidget: $isHideFromWidget, moment: $moment, deleteAction: $deleteAction)';
}


}

/// @nodoc
abstract mixin class _$MomentDetailStateCopyWith<$Res> implements $MomentDetailStateCopyWith<$Res> {
  factory _$MomentDetailStateCopyWith(_MomentDetailState value, $Res Function(_MomentDetailState) _then) = __$MomentDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool showDeleteConfirm, bool isEnablePinOnTop, bool isHideFromWidget, Loaded<MomentEntity> moment, Loaded<Unit> deleteAction
});




}
/// @nodoc
class __$MomentDetailStateCopyWithImpl<$Res>
    implements _$MomentDetailStateCopyWith<$Res> {
  __$MomentDetailStateCopyWithImpl(this._self, this._then);

  final _MomentDetailState _self;
  final $Res Function(_MomentDetailState) _then;

/// Create a copy of MomentDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showDeleteConfirm = null,Object? isEnablePinOnTop = null,Object? isHideFromWidget = null,Object? moment = null,Object? deleteAction = null,}) {
  return _then(_MomentDetailState(
showDeleteConfirm: null == showDeleteConfirm ? _self.showDeleteConfirm : showDeleteConfirm // ignore: cast_nullable_to_non_nullable
as bool,isEnablePinOnTop: null == isEnablePinOnTop ? _self.isEnablePinOnTop : isEnablePinOnTop // ignore: cast_nullable_to_non_nullable
as bool,isHideFromWidget: null == isHideFromWidget ? _self.isHideFromWidget : isHideFromWidget // ignore: cast_nullable_to_non_nullable
as bool,moment: null == moment ? _self.moment : moment // ignore: cast_nullable_to_non_nullable
as Loaded<MomentEntity>,deleteAction: null == deleteAction ? _self.deleteAction : deleteAction // ignore: cast_nullable_to_non_nullable
as Loaded<Unit>,
  ));
}


}

// dart format on

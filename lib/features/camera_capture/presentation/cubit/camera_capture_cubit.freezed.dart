// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_capture_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraCaptureState {

 bool get isInitializing; bool get isReady; bool get isCapturing; bool get permissionDenied; String? get errorMessage; List<File> get captured;
/// Create a copy of CameraCaptureState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraCaptureStateCopyWith<CameraCaptureState> get copyWith => _$CameraCaptureStateCopyWithImpl<CameraCaptureState>(this as CameraCaptureState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraCaptureState&&(identical(other.isInitializing, isInitializing) || other.isInitializing == isInitializing)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.isCapturing, isCapturing) || other.isCapturing == isCapturing)&&(identical(other.permissionDenied, permissionDenied) || other.permissionDenied == permissionDenied)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.captured, captured));
}


@override
int get hashCode => Object.hash(runtimeType,isInitializing,isReady,isCapturing,permissionDenied,errorMessage,const DeepCollectionEquality().hash(captured));

@override
String toString() {
  return 'CameraCaptureState(isInitializing: $isInitializing, isReady: $isReady, isCapturing: $isCapturing, permissionDenied: $permissionDenied, errorMessage: $errorMessage, captured: $captured)';
}


}

/// @nodoc
abstract mixin class $CameraCaptureStateCopyWith<$Res>  {
  factory $CameraCaptureStateCopyWith(CameraCaptureState value, $Res Function(CameraCaptureState) _then) = _$CameraCaptureStateCopyWithImpl;
@useResult
$Res call({
 bool isInitializing, bool isReady, bool isCapturing, bool permissionDenied, String? errorMessage, List<File> captured
});




}
/// @nodoc
class _$CameraCaptureStateCopyWithImpl<$Res>
    implements $CameraCaptureStateCopyWith<$Res> {
  _$CameraCaptureStateCopyWithImpl(this._self, this._then);

  final CameraCaptureState _self;
  final $Res Function(CameraCaptureState) _then;

/// Create a copy of CameraCaptureState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isInitializing = null,Object? isReady = null,Object? isCapturing = null,Object? permissionDenied = null,Object? errorMessage = freezed,Object? captured = null,}) {
  return _then(_self.copyWith(
isInitializing: null == isInitializing ? _self.isInitializing : isInitializing // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,isCapturing: null == isCapturing ? _self.isCapturing : isCapturing // ignore: cast_nullable_to_non_nullable
as bool,permissionDenied: null == permissionDenied ? _self.permissionDenied : permissionDenied // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,captured: null == captured ? _self.captured : captured // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}

}


/// Adds pattern-matching-related methods to [CameraCaptureState].
extension CameraCaptureStatePatterns on CameraCaptureState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CameraCaptureState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CameraCaptureState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CameraCaptureState value)  $default,){
final _that = this;
switch (_that) {
case _CameraCaptureState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CameraCaptureState value)?  $default,){
final _that = this;
switch (_that) {
case _CameraCaptureState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isInitializing,  bool isReady,  bool isCapturing,  bool permissionDenied,  String? errorMessage,  List<File> captured)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CameraCaptureState() when $default != null:
return $default(_that.isInitializing,_that.isReady,_that.isCapturing,_that.permissionDenied,_that.errorMessage,_that.captured);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isInitializing,  bool isReady,  bool isCapturing,  bool permissionDenied,  String? errorMessage,  List<File> captured)  $default,) {final _that = this;
switch (_that) {
case _CameraCaptureState():
return $default(_that.isInitializing,_that.isReady,_that.isCapturing,_that.permissionDenied,_that.errorMessage,_that.captured);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isInitializing,  bool isReady,  bool isCapturing,  bool permissionDenied,  String? errorMessage,  List<File> captured)?  $default,) {final _that = this;
switch (_that) {
case _CameraCaptureState() when $default != null:
return $default(_that.isInitializing,_that.isReady,_that.isCapturing,_that.permissionDenied,_that.errorMessage,_that.captured);case _:
  return null;

}
}

}

/// @nodoc


class _CameraCaptureState implements CameraCaptureState {
  const _CameraCaptureState({this.isInitializing = false, this.isReady = false, this.isCapturing = false, this.permissionDenied = false, this.errorMessage, final  List<File> captured = const []}): _captured = captured;
  

@override@JsonKey() final  bool isInitializing;
@override@JsonKey() final  bool isReady;
@override@JsonKey() final  bool isCapturing;
@override@JsonKey() final  bool permissionDenied;
@override final  String? errorMessage;
 final  List<File> _captured;
@override@JsonKey() List<File> get captured {
  if (_captured is EqualUnmodifiableListView) return _captured;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_captured);
}


/// Create a copy of CameraCaptureState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraCaptureStateCopyWith<_CameraCaptureState> get copyWith => __$CameraCaptureStateCopyWithImpl<_CameraCaptureState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraCaptureState&&(identical(other.isInitializing, isInitializing) || other.isInitializing == isInitializing)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.isCapturing, isCapturing) || other.isCapturing == isCapturing)&&(identical(other.permissionDenied, permissionDenied) || other.permissionDenied == permissionDenied)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._captured, _captured));
}


@override
int get hashCode => Object.hash(runtimeType,isInitializing,isReady,isCapturing,permissionDenied,errorMessage,const DeepCollectionEquality().hash(_captured));

@override
String toString() {
  return 'CameraCaptureState(isInitializing: $isInitializing, isReady: $isReady, isCapturing: $isCapturing, permissionDenied: $permissionDenied, errorMessage: $errorMessage, captured: $captured)';
}


}

/// @nodoc
abstract mixin class _$CameraCaptureStateCopyWith<$Res> implements $CameraCaptureStateCopyWith<$Res> {
  factory _$CameraCaptureStateCopyWith(_CameraCaptureState value, $Res Function(_CameraCaptureState) _then) = __$CameraCaptureStateCopyWithImpl;
@override @useResult
$Res call({
 bool isInitializing, bool isReady, bool isCapturing, bool permissionDenied, String? errorMessage, List<File> captured
});




}
/// @nodoc
class __$CameraCaptureStateCopyWithImpl<$Res>
    implements _$CameraCaptureStateCopyWith<$Res> {
  __$CameraCaptureStateCopyWithImpl(this._self, this._then);

  final _CameraCaptureState _self;
  final $Res Function(_CameraCaptureState) _then;

/// Create a copy of CameraCaptureState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isInitializing = null,Object? isReady = null,Object? isCapturing = null,Object? permissionDenied = null,Object? errorMessage = freezed,Object? captured = null,}) {
  return _then(_CameraCaptureState(
isInitializing: null == isInitializing ? _self.isInitializing : isInitializing // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,isCapturing: null == isCapturing ? _self.isCapturing : isCapturing // ignore: cast_nullable_to_non_nullable
as bool,permissionDenied: null == permissionDenied ? _self.permissionDenied : permissionDenied // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,captured: null == captured ? _self._captured : captured // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}


}

// dart format on

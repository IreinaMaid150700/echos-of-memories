// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadedLocalData value)?  loadedLocalData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadedLocalData() when loadedLocalData != null:
return loadedLocalData(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadedLocalData value)  loadedLocalData,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadedLocalData():
return loadedLocalData(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadedLocalData value)?  loadedLocalData,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadedLocalData() when loadedLocalData != null:
return loadedLocalData(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( SplashNavigationEvent navigation)?  loadedLocalData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadedLocalData() when loadedLocalData != null:
return loadedLocalData(_that.navigation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( SplashNavigationEvent navigation)  loadedLocalData,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _LoadedLocalData():
return loadedLocalData(_that.navigation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( SplashNavigationEvent navigation)?  loadedLocalData,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadedLocalData() when loadedLocalData != null:
return loadedLocalData(_that.navigation);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SplashState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.initial()';
}


}




/// @nodoc


class _LoadedLocalData implements SplashState {
  const _LoadedLocalData({required this.navigation});
  

 final  SplashNavigationEvent navigation;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedLocalDataCopyWith<_LoadedLocalData> get copyWith => __$LoadedLocalDataCopyWithImpl<_LoadedLocalData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedLocalData&&(identical(other.navigation, navigation) || other.navigation == navigation));
}


@override
int get hashCode => Object.hash(runtimeType,navigation);

@override
String toString() {
  return 'SplashState.loadedLocalData(navigation: $navigation)';
}


}

/// @nodoc
abstract mixin class _$LoadedLocalDataCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$LoadedLocalDataCopyWith(_LoadedLocalData value, $Res Function(_LoadedLocalData) _then) = __$LoadedLocalDataCopyWithImpl;
@useResult
$Res call({
 SplashNavigationEvent navigation
});




}
/// @nodoc
class __$LoadedLocalDataCopyWithImpl<$Res>
    implements _$LoadedLocalDataCopyWith<$Res> {
  __$LoadedLocalDataCopyWithImpl(this._self, this._then);

  final _LoadedLocalData _self;
  final $Res Function(_LoadedLocalData) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? navigation = null,}) {
  return _then(_LoadedLocalData(
navigation: null == navigation ? _self.navigation : navigation // ignore: cast_nullable_to_non_nullable
as SplashNavigationEvent,
  ));
}


}

// dart format on

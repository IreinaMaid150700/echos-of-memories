// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_collection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateCollectionState {

 String get title; String get description; CollectionCover get cover; int get moodIndex; bool get isPrivate; bool get isPinned;
/// Create a copy of CreateCollectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCollectionStateCopyWith<CreateCollectionState> get copyWith => _$CreateCollectionStateCopyWithImpl<CreateCollectionState>(this as CreateCollectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCollectionState&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.moodIndex, moodIndex) || other.moodIndex == moodIndex)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,cover,moodIndex,isPrivate,isPinned);

@override
String toString() {
  return 'CreateCollectionState(title: $title, description: $description, cover: $cover, moodIndex: $moodIndex, isPrivate: $isPrivate, isPinned: $isPinned)';
}


}

/// @nodoc
abstract mixin class $CreateCollectionStateCopyWith<$Res>  {
  factory $CreateCollectionStateCopyWith(CreateCollectionState value, $Res Function(CreateCollectionState) _then) = _$CreateCollectionStateCopyWithImpl;
@useResult
$Res call({
 String title, String description, CollectionCover cover, int moodIndex, bool isPrivate, bool isPinned
});




}
/// @nodoc
class _$CreateCollectionStateCopyWithImpl<$Res>
    implements $CreateCollectionStateCopyWith<$Res> {
  _$CreateCollectionStateCopyWithImpl(this._self, this._then);

  final CreateCollectionState _self;
  final $Res Function(CreateCollectionState) _then;

/// Create a copy of CreateCollectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? cover = null,Object? moodIndex = null,Object? isPrivate = null,Object? isPinned = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as CollectionCover,moodIndex: null == moodIndex ? _self.moodIndex : moodIndex // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCollectionState].
extension CreateCollectionStatePatterns on CreateCollectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCollectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCollectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCollectionState value)  $default,){
final _that = this;
switch (_that) {
case _CreateCollectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCollectionState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCollectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  CollectionCover cover,  int moodIndex,  bool isPrivate,  bool isPinned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCollectionState() when $default != null:
return $default(_that.title,_that.description,_that.cover,_that.moodIndex,_that.isPrivate,_that.isPinned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  CollectionCover cover,  int moodIndex,  bool isPrivate,  bool isPinned)  $default,) {final _that = this;
switch (_that) {
case _CreateCollectionState():
return $default(_that.title,_that.description,_that.cover,_that.moodIndex,_that.isPrivate,_that.isPinned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  CollectionCover cover,  int moodIndex,  bool isPrivate,  bool isPinned)?  $default,) {final _that = this;
switch (_that) {
case _CreateCollectionState() when $default != null:
return $default(_that.title,_that.description,_that.cover,_that.moodIndex,_that.isPrivate,_that.isPinned);case _:
  return null;

}
}

}

/// @nodoc


class _CreateCollectionState extends CreateCollectionState {
  const _CreateCollectionState({this.title = '', this.description = '', this.cover = CollectionCover.peaceful, this.moodIndex = -1, this.isPrivate = true, this.isPinned = false}): super._();
  

@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  CollectionCover cover;
@override@JsonKey() final  int moodIndex;
@override@JsonKey() final  bool isPrivate;
@override@JsonKey() final  bool isPinned;

/// Create a copy of CreateCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCollectionStateCopyWith<_CreateCollectionState> get copyWith => __$CreateCollectionStateCopyWithImpl<_CreateCollectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCollectionState&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.moodIndex, moodIndex) || other.moodIndex == moodIndex)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,cover,moodIndex,isPrivate,isPinned);

@override
String toString() {
  return 'CreateCollectionState(title: $title, description: $description, cover: $cover, moodIndex: $moodIndex, isPrivate: $isPrivate, isPinned: $isPinned)';
}


}

/// @nodoc
abstract mixin class _$CreateCollectionStateCopyWith<$Res> implements $CreateCollectionStateCopyWith<$Res> {
  factory _$CreateCollectionStateCopyWith(_CreateCollectionState value, $Res Function(_CreateCollectionState) _then) = __$CreateCollectionStateCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, CollectionCover cover, int moodIndex, bool isPrivate, bool isPinned
});




}
/// @nodoc
class __$CreateCollectionStateCopyWithImpl<$Res>
    implements _$CreateCollectionStateCopyWith<$Res> {
  __$CreateCollectionStateCopyWithImpl(this._self, this._then);

  final _CreateCollectionState _self;
  final $Res Function(_CreateCollectionState) _then;

/// Create a copy of CreateCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? cover = null,Object? moodIndex = null,Object? isPrivate = null,Object? isPinned = null,}) {
  return _then(_CreateCollectionState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as CollectionCover,moodIndex: null == moodIndex ? _self.moodIndex : moodIndex // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

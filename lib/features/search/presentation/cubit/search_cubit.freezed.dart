// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 String get query; String? get selectedMoodId; Loaded<List<MomentSummary>> get results; Loaded<List<MoodEntity>> get moods; Loaded<List<TagEntity>> get suggestedTags; List<String> get recentSearches;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.query, query) || other.query == query)&&(identical(other.selectedMoodId, selectedMoodId) || other.selectedMoodId == selectedMoodId)&&(identical(other.results, results) || other.results == results)&&(identical(other.moods, moods) || other.moods == moods)&&(identical(other.suggestedTags, suggestedTags) || other.suggestedTags == suggestedTags)&&const DeepCollectionEquality().equals(other.recentSearches, recentSearches));
}


@override
int get hashCode => Object.hash(runtimeType,query,selectedMoodId,results,moods,suggestedTags,const DeepCollectionEquality().hash(recentSearches));

@override
String toString() {
  return 'SearchState(query: $query, selectedMoodId: $selectedMoodId, results: $results, moods: $moods, suggestedTags: $suggestedTags, recentSearches: $recentSearches)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String query, String? selectedMoodId, Loaded<List<MomentSummary>> results, Loaded<List<MoodEntity>> moods, Loaded<List<TagEntity>> suggestedTags, List<String> recentSearches
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? selectedMoodId = freezed,Object? results = null,Object? moods = null,Object? suggestedTags = null,Object? recentSearches = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,selectedMoodId: freezed == selectedMoodId ? _self.selectedMoodId : selectedMoodId // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as Loaded<List<MomentSummary>>,moods: null == moods ? _self.moods : moods // ignore: cast_nullable_to_non_nullable
as Loaded<List<MoodEntity>>,suggestedTags: null == suggestedTags ? _self.suggestedTags : suggestedTags // ignore: cast_nullable_to_non_nullable
as Loaded<List<TagEntity>>,recentSearches: null == recentSearches ? _self.recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  String? selectedMoodId,  Loaded<List<MomentSummary>> results,  Loaded<List<MoodEntity>> moods,  Loaded<List<TagEntity>> suggestedTags,  List<String> recentSearches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.selectedMoodId,_that.results,_that.moods,_that.suggestedTags,_that.recentSearches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  String? selectedMoodId,  Loaded<List<MomentSummary>> results,  Loaded<List<MoodEntity>> moods,  Loaded<List<TagEntity>> suggestedTags,  List<String> recentSearches)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.query,_that.selectedMoodId,_that.results,_that.moods,_that.suggestedTags,_that.recentSearches);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  String? selectedMoodId,  Loaded<List<MomentSummary>> results,  Loaded<List<MoodEntity>> moods,  Loaded<List<TagEntity>> suggestedTags,  List<String> recentSearches)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.selectedMoodId,_that.results,_that.moods,_that.suggestedTags,_that.recentSearches);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
  const _SearchState({this.query = '', this.selectedMoodId, this.results = const Loaded<List<MomentSummary>>(), this.moods = const Loaded<List<MoodEntity>>(), this.suggestedTags = const Loaded<List<TagEntity>>(), final  List<String> recentSearches = const <String>[]}): _recentSearches = recentSearches;
  

@override@JsonKey() final  String query;
@override final  String? selectedMoodId;
@override@JsonKey() final  Loaded<List<MomentSummary>> results;
@override@JsonKey() final  Loaded<List<MoodEntity>> moods;
@override@JsonKey() final  Loaded<List<TagEntity>> suggestedTags;
 final  List<String> _recentSearches;
@override@JsonKey() List<String> get recentSearches {
  if (_recentSearches is EqualUnmodifiableListView) return _recentSearches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSearches);
}


/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.query, query) || other.query == query)&&(identical(other.selectedMoodId, selectedMoodId) || other.selectedMoodId == selectedMoodId)&&(identical(other.results, results) || other.results == results)&&(identical(other.moods, moods) || other.moods == moods)&&(identical(other.suggestedTags, suggestedTags) || other.suggestedTags == suggestedTags)&&const DeepCollectionEquality().equals(other._recentSearches, _recentSearches));
}


@override
int get hashCode => Object.hash(runtimeType,query,selectedMoodId,results,moods,suggestedTags,const DeepCollectionEquality().hash(_recentSearches));

@override
String toString() {
  return 'SearchState(query: $query, selectedMoodId: $selectedMoodId, results: $results, moods: $moods, suggestedTags: $suggestedTags, recentSearches: $recentSearches)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query, String? selectedMoodId, Loaded<List<MomentSummary>> results, Loaded<List<MoodEntity>> moods, Loaded<List<TagEntity>> suggestedTags, List<String> recentSearches
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? selectedMoodId = freezed,Object? results = null,Object? moods = null,Object? suggestedTags = null,Object? recentSearches = null,}) {
  return _then(_SearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,selectedMoodId: freezed == selectedMoodId ? _self.selectedMoodId : selectedMoodId // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as Loaded<List<MomentSummary>>,moods: null == moods ? _self.moods : moods // ignore: cast_nullable_to_non_nullable
as Loaded<List<MoodEntity>>,suggestedTags: null == suggestedTags ? _self.suggestedTags : suggestedTags // ignore: cast_nullable_to_non_nullable
as Loaded<List<TagEntity>>,recentSearches: null == recentSearches ? _self._recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

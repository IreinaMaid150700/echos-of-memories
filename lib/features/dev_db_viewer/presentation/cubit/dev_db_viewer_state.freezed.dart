// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dev_db_viewer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DevDbViewerState {

 List<TableMeta> get tables; String? get selectedTable; List<String> get columns; List<DbRow> get rows; int get totalCount; bool get isLoading; bool get isLoadingMore; String? get error;
/// Create a copy of DevDbViewerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevDbViewerStateCopyWith<DevDbViewerState> get copyWith => _$DevDbViewerStateCopyWithImpl<DevDbViewerState>(this as DevDbViewerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DevDbViewerState&&const DeepCollectionEquality().equals(other.tables, tables)&&(identical(other.selectedTable, selectedTable) || other.selectedTable == selectedTable)&&const DeepCollectionEquality().equals(other.columns, columns)&&const DeepCollectionEquality().equals(other.rows, rows)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tables),selectedTable,const DeepCollectionEquality().hash(columns),const DeepCollectionEquality().hash(rows),totalCount,isLoading,isLoadingMore,error);

@override
String toString() {
  return 'DevDbViewerState(tables: $tables, selectedTable: $selectedTable, columns: $columns, rows: $rows, totalCount: $totalCount, isLoading: $isLoading, isLoadingMore: $isLoadingMore, error: $error)';
}


}

/// @nodoc
abstract mixin class $DevDbViewerStateCopyWith<$Res>  {
  factory $DevDbViewerStateCopyWith(DevDbViewerState value, $Res Function(DevDbViewerState) _then) = _$DevDbViewerStateCopyWithImpl;
@useResult
$Res call({
 List<TableMeta> tables, String? selectedTable, List<String> columns, List<DbRow> rows, int totalCount, bool isLoading, bool isLoadingMore, String? error
});




}
/// @nodoc
class _$DevDbViewerStateCopyWithImpl<$Res>
    implements $DevDbViewerStateCopyWith<$Res> {
  _$DevDbViewerStateCopyWithImpl(this._self, this._then);

  final DevDbViewerState _self;
  final $Res Function(DevDbViewerState) _then;

/// Create a copy of DevDbViewerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tables = null,Object? selectedTable = freezed,Object? columns = null,Object? rows = null,Object? totalCount = null,Object? isLoading = null,Object? isLoadingMore = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as List<TableMeta>,selectedTable: freezed == selectedTable ? _self.selectedTable : selectedTable // ignore: cast_nullable_to_non_nullable
as String?,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as List<String>,rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<DbRow>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DevDbViewerState].
extension DevDbViewerStatePatterns on DevDbViewerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DevDbViewerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DevDbViewerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DevDbViewerState value)  $default,){
final _that = this;
switch (_that) {
case _DevDbViewerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DevDbViewerState value)?  $default,){
final _that = this;
switch (_that) {
case _DevDbViewerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TableMeta> tables,  String? selectedTable,  List<String> columns,  List<DbRow> rows,  int totalCount,  bool isLoading,  bool isLoadingMore,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DevDbViewerState() when $default != null:
return $default(_that.tables,_that.selectedTable,_that.columns,_that.rows,_that.totalCount,_that.isLoading,_that.isLoadingMore,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TableMeta> tables,  String? selectedTable,  List<String> columns,  List<DbRow> rows,  int totalCount,  bool isLoading,  bool isLoadingMore,  String? error)  $default,) {final _that = this;
switch (_that) {
case _DevDbViewerState():
return $default(_that.tables,_that.selectedTable,_that.columns,_that.rows,_that.totalCount,_that.isLoading,_that.isLoadingMore,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TableMeta> tables,  String? selectedTable,  List<String> columns,  List<DbRow> rows,  int totalCount,  bool isLoading,  bool isLoadingMore,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _DevDbViewerState() when $default != null:
return $default(_that.tables,_that.selectedTable,_that.columns,_that.rows,_that.totalCount,_that.isLoading,_that.isLoadingMore,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _DevDbViewerState implements DevDbViewerState {
  const _DevDbViewerState({final  List<TableMeta> tables = const <TableMeta>[], this.selectedTable, final  List<String> columns = const <String>[], final  List<DbRow> rows = const <DbRow>[], this.totalCount = 0, this.isLoading = false, this.isLoadingMore = false, this.error}): _tables = tables,_columns = columns,_rows = rows;
  

 final  List<TableMeta> _tables;
@override@JsonKey() List<TableMeta> get tables {
  if (_tables is EqualUnmodifiableListView) return _tables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tables);
}

@override final  String? selectedTable;
 final  List<String> _columns;
@override@JsonKey() List<String> get columns {
  if (_columns is EqualUnmodifiableListView) return _columns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_columns);
}

 final  List<DbRow> _rows;
@override@JsonKey() List<DbRow> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}

@override@JsonKey() final  int totalCount;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingMore;
@override final  String? error;

/// Create a copy of DevDbViewerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevDbViewerStateCopyWith<_DevDbViewerState> get copyWith => __$DevDbViewerStateCopyWithImpl<_DevDbViewerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DevDbViewerState&&const DeepCollectionEquality().equals(other._tables, _tables)&&(identical(other.selectedTable, selectedTable) || other.selectedTable == selectedTable)&&const DeepCollectionEquality().equals(other._columns, _columns)&&const DeepCollectionEquality().equals(other._rows, _rows)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tables),selectedTable,const DeepCollectionEquality().hash(_columns),const DeepCollectionEquality().hash(_rows),totalCount,isLoading,isLoadingMore,error);

@override
String toString() {
  return 'DevDbViewerState(tables: $tables, selectedTable: $selectedTable, columns: $columns, rows: $rows, totalCount: $totalCount, isLoading: $isLoading, isLoadingMore: $isLoadingMore, error: $error)';
}


}

/// @nodoc
abstract mixin class _$DevDbViewerStateCopyWith<$Res> implements $DevDbViewerStateCopyWith<$Res> {
  factory _$DevDbViewerStateCopyWith(_DevDbViewerState value, $Res Function(_DevDbViewerState) _then) = __$DevDbViewerStateCopyWithImpl;
@override @useResult
$Res call({
 List<TableMeta> tables, String? selectedTable, List<String> columns, List<DbRow> rows, int totalCount, bool isLoading, bool isLoadingMore, String? error
});




}
/// @nodoc
class __$DevDbViewerStateCopyWithImpl<$Res>
    implements _$DevDbViewerStateCopyWith<$Res> {
  __$DevDbViewerStateCopyWithImpl(this._self, this._then);

  final _DevDbViewerState _self;
  final $Res Function(_DevDbViewerState) _then;

/// Create a copy of DevDbViewerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tables = null,Object? selectedTable = freezed,Object? columns = null,Object? rows = null,Object? totalCount = null,Object? isLoading = null,Object? isLoadingMore = null,Object? error = freezed,}) {
  return _then(_DevDbViewerState(
tables: null == tables ? _self._tables : tables // ignore: cast_nullable_to_non_nullable
as List<TableMeta>,selectedTable: freezed == selectedTable ? _self.selectedTable : selectedTable // ignore: cast_nullable_to_non_nullable
as String?,columns: null == columns ? _self._columns : columns // ignore: cast_nullable_to_non_nullable
as List<String>,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<DbRow>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

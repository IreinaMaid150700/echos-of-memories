part of 'create_collection_cubit.dart';

@freezed
abstract class CreateCollectionState with _$CreateCollectionState {
  const factory CreateCollectionState({
    @Default('') String title,
    @Default('') String description,
    @Default(CollectionCover.peaceful) CollectionCover cover,
    @Default(-1) int moodIndex,
    @Default(true) bool isPrivate,
    @Default(false) bool isPinned,
  }) = _CreateCollectionState;

  const CreateCollectionState._();

  bool get canSave => title.trim().isNotEmpty;
}

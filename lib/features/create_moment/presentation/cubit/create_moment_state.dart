part of 'create_moment_cubit.dart';

@freezed
abstract class CreateMomentState with _$CreateMomentState {
  const factory CreateMomentState({
    CreateMomentDirectEnum? createMomentDirectEnum,
    @Default([]) List<File> imagePicker,
    String? note,
    DateTime? momentDate,
    @Default([]) List<TagEntity> tagsSelected,
    String? toneIdSelected,
    double? latitude,
    double? longitude,
    String? locationName,
    @Default(false) bool isPickingLocation,
    String? locationMessage,
    @Default(false) bool hideFromWidget,
    @Default(false) bool isLockMoment,
    @Default(false) bool isLoved,
    @Default(0) int timeStamp,
    @Default(Loaded<List<TagEntity>>()) Loaded<List<TagEntity>> tagsSuggestions,
    @Default('') String inputText,
    @Default(Loaded<MomentEntity>()) Loaded<MomentEntity> saveAction,
  }) = _CreateMomentState;
}

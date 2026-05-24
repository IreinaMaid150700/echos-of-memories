part of 'create_moment_cubit.dart';

@freezed
abstract class CreateMomentState with _$CreateMomentState {
  const factory CreateMomentState({
    CreateMomentDirectEnum? createMomentDirectEnum,
    @Default([]) List<File> imagePicker,
    String? note,
    DateTime? momentDate,
    @Default([]) List<String> tagsIdSelect,
    String? toneIdSelected,
    @Default(false) bool hideFromWidget,
    @Default(false) bool isLockMoment,
    @Default(false) bool isLoved,
    @Default(0) int timeStamp,
  }) = _CreateMomentState;
}

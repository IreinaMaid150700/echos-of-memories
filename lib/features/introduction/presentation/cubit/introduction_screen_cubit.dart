import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'introduction_screen_state.dart';
part 'introduction_screen_cubit.freezed.dart';

class IntroductionScreenCubit extends Cubit<IntroductionScreenState> {
  IntroductionScreenCubit() : super(IntroductionScreenState.initial());
}

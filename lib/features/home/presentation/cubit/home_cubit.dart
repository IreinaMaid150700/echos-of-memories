
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends BaseCubit<HomeState>{
  HomeCubit() : super(const HomeState());

  void onChangeBottomBar(int index){
    emit(state.copyWith(currentTab: index));
  }
}
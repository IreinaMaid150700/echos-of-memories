import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/core/utils/extensions/date_time_extension.dart';
import 'package:music_app/core/widgets/under_development_dialog.dart';
import 'package:music_app/features/create_moment/domain/enum/create_moment_direct_enum.dart';
import 'package:music_app/features/create_moment/domain/usecases/get_tags_usecase.dart';
import 'package:music_app/features/create_moment/presentation/cubit/create_moment_cubit.dart';

part 'widgets/_create_app_bar.dart';
part 'widgets/_media_picker_section.dart';
part 'widgets/_note_input_section.dart';
part 'widgets/_date_location_card.dart';
part 'widgets/_mood_selector_section.dart';
part 'widgets/_tag_input_section.dart';
part 'widgets/_collection_row.dart';
part 'widgets/_memory_tone_section.dart';
part 'widgets/_privacy_card.dart';
part 'widgets/_bottom_save_cta.dart';

@RoutePage()
class CreateMomentScreen extends StatelessWidget {
  const CreateMomentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CreateMomentCubit(getTagsUseCase: getIt<GetTagsUseCase>())
            ..initialData(),
      child: const _CreateMomentBody(),
    );
  }
}

class _CreateMomentBody extends StatelessWidget {
  const _CreateMomentBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateMomentCubit, CreateMomentState>(
      listenWhen: (previous, current) =>
          previous.createMomentDirectEnum != current.createMomentDirectEnum ||
          previous.timeStamp != current.timeStamp,
      listener: (context, state) {
        if (state.createMomentDirectEnum != null) {
          switch (state.createMomentDirectEnum) {
            case CreateMomentDirectEnum.showDialogDevelopment:
              UnderDevelopmentDialog.show(context);
              break;
            default:
          }
        }
      },
      child: Scaffold(
        backgroundColor: context.themeColors.background,
        appBar: const _CreateAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _MediaPickerSection(),
                      Gap(AppSpacing.xl),
                      _NoteInputSection(),
                      Gap(AppSpacing.xl),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.xl,
                        ),
                        child: _DateLocationCard(),
                      ),
                      Gap(AppSpacing.xl),
                      _MoodSelectorSection(),
                      Gap(AppSpacing.xl),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.xl,
                        ),
                        child: _TagInputSection(),
                      ),
                      Gap(AppSpacing.xl),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.xl,
                        ),
                        child: _CollectionRow(),
                      ),
                      Gap(AppSpacing.xl),
                      _MemoryToneSection(),
                      Gap(AppSpacing.xl),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.xl,
                        ),
                        child: _PrivacyCard(),
                      ),
                      Gap(AppSpacing.xxl),
                    ],
                  ),
                ),
              ),
              const _BottomSaveCta(),
            ],
          ),
        ),
      ),
    );
  }
}

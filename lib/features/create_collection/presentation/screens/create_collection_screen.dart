import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/create_collection/domain/enum/collection_cover.dart';
import 'package:music_app/features/create_collection/presentation/cubit/create_collection_cubit.dart';

part 'widgets/_create_collection_app_bar.dart';
part 'widgets/_cover_section.dart';
part 'widgets/_title_section.dart';
part 'widgets/_description_section.dart';
part 'widgets/_mood_section.dart';
part 'widgets/_privacy_section.dart';
part 'widgets/_bottom_action_bar.dart';

@RoutePage()
class CreateCollectionScreen extends StatelessWidget {
  const CreateCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateCollectionCubit(),
      child: const _CreateCollectionBody(),
    );
  }
}

class _CreateCollectionBody extends StatelessWidget {
  const _CreateCollectionBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeColors.background,
      appBar: const _CreateCollectionAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.xl,
                  AppSpacing.md,
                  AppSpacing.xl,
                  AppSpacing.xxl,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CoverSection(),
                    Gap(AppSpacing.xl),
                    _TitleSection(),
                    Gap(AppSpacing.lg),
                    _DescriptionSection(),
                    Gap(AppSpacing.lg),
                    _MoodSection(),
                    Gap(AppSpacing.xl),
                    _PrivacySection(),
                  ],
                ),
              ),
            ),
            const _BottomActionBar(),
          ],
        ),
      ),
    );
  }
}

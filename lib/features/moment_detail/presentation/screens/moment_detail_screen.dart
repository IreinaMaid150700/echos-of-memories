import 'package:auto_route/auto_route.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/core/utils/extensions/date_time_extension.dart';
import 'package:music_app/features/moment/domain/usecases/delete_moment_usecase.dart';
import 'package:music_app/features/moment/domain/usecases/get_moment_by_id_usecase.dart';
import 'package:music_app/features/moment/domain/usecases/update_moment_flags_usecase.dart';
import 'package:music_app/features/moment_detail/presentation/screens/cubit/moment_detail_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part '../widgets/fullscreen_button.dart';
part '../widgets/swiper_indicator.dart';
part '../widgets/moment_content.dart';
part '../widgets/moment_header.dart';
part '../widgets/memory_info.dart';
part '../widgets/organization_card.dart';
part '../widgets/widget_and_privacy_card.dart';
part '../widgets/delete_section.dart';

@RoutePage()
class MomentDetailScreen extends StatelessWidget {
  final String momentId;
  const MomentDetailScreen({super.key, required this.momentId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MomentDetailCubit(
        getMomentByIdUseCase: getIt<GetMomentByIdUseCase>(),
        deleteMomentUseCase: getIt<DeleteMomentUseCase>(),
        updateMomentFlagsUseCase: getIt<UpdateMomentFlagsUseCase>(),
      )..loadMoment(momentId),
      child: Scaffold(
        backgroundColor: context.themeColors.background,
        body: SafeArea(
          child: Column(
            children: [
              const _MomentHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xl,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Gap(AppSpacing.lg),
                      _MediaCarousel(),
                      Gap(AppSpacing.xs),
                      _PageIndicator(),

                      Gap(AppSpacing.xl),
                      _MomentContent(),
                      Gap(AppSpacing.lg),
                      _MemoryInfoCard(),
                      Gap(AppSpacing.lg),
                      _OrganizationCard(),
                      Gap(AppSpacing.lg),
                      _WidgetPrivacyCard(),
                      Gap(AppSpacing.lg),
                      _DeleteCard(),
                      Gap(AppSpacing.lg),
                      _Footer(),
                      Gap(AppSpacing.xl),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MediaCarousel extends StatelessWidget {
  const _MediaCarousel();

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return _imageOutlined(context);
      },
      itemCount: 1,
      itemWidth: 300.0,
      itemHeight: 400.0,
      layout: SwiperLayout.TINDER,
    );
  }

  Widget _imageOutlined(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 32, 32, 32),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Center(
            child: Icon(
              Icons.image_outlined,
              size: 64,
              color: context.themeColors.textMuted,
            ),
          ),
        ),
        Positioned(
          top: AppSpacing.sm,
          right: AppSpacing.sm,
          child: const _FullscreenButton(),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.themeColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: context.themeColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.md,
              top: AppSpacing.md,
              bottom: AppSpacing.xs,
            ),
            child: Text(
              title,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.themeColors.textMuted,
                letterSpacing: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: child,
          ),
          const Gap(AppSpacing.md),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '· Kept privately on this device ·',
        style: context.textTheme.labelSmall?.copyWith(
          color: context.themeColors.textMuted,
        ),
      ),
    );
  }
}

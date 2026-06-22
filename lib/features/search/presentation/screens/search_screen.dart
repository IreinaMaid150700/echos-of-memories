import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/gen/assets.gen.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/core/utils/extensions/color_hex_extension.dart';
import 'package:music_app/core/utils/extensions/date_time_extension.dart';
import 'package:music_app/core/utils/extensions/screen_padding.dart';
import 'package:music_app/features/moment/domain/models/moment_summary.dart';
import 'package:music_app/features/mood_tone/domain/models/mood_entity.dart';
import 'package:music_app/features/mood_tone/domain/usecases/get_moods_usecase.dart';
import 'package:music_app/features/search/domain/usecases/add_recent_search_usecase.dart';
import 'package:music_app/features/search/domain/usecases/get_recent_searches_usecase.dart';
import 'package:music_app/features/search/domain/usecases/get_suggested_tags_usecase.dart';
import 'package:music_app/features/search/domain/usecases/search_moments_usecase.dart';
import 'package:music_app/features/search/presentation/cubit/search_cubit.dart';

part 'widgets/_search_app_bar.dart';
part 'widgets/_mood_filter_section.dart';
part 'widgets/_empty_state_section.dart';
part 'widgets/_results_section.dart';
part 'widgets/_search_result_card.dart';
part 'widgets/_search_footer.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(
        searchMomentsUseCase: getIt<SearchMomentsUseCase>(),
        getSuggestedTagsUseCase: getIt<GetSuggestedTagsUseCase>(),
        getRecentSearchesUseCase: getIt<GetRecentSearchesUseCase>(),
        addRecentSearchUseCase: getIt<AddRecentSearchUseCase>(),
        getMoodsUseCase: getIt<GetMoodsUseCase>(),
      )..init(),
      child: const _SearchBody(),
    );
  }
}

class _SearchBody extends StatefulWidget {
  const _SearchBody();

  @override
  State<_SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<_SearchBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _fillAndSearch(String value) {
    _controller.text = value;
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: value.length),
    );
    context.read<SearchCubit>().submitQuery(value);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SearchAppBar(controller: _controller),
            const _MoodFilterSection(),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  final cubit = context.read<SearchCubit>();
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (cubit.hasActiveQuery)
                          const _ResultsSection()
                        else
                          _EmptyStateSection(onTermTap: _fillAndSearch),
                        const Gap(AppSpacing.lg),
                        const _SearchFooter(),
                        const Gap(AppSpacing.lg),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: AppSpacing.xl),
    );
  }
}

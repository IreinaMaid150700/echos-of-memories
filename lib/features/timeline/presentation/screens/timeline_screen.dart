import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/shared/widgets/empty_state_widget.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/utils/extensions/date_time_extension.dart';
import 'package:music_app/core/utils/extensions/screen_padding.dart';
import 'package:music_app/features/moment/domain/models/moment_entity.dart';
import 'package:music_app/features/moment/domain/usecases/get_moments_usecase.dart';
import 'package:music_app/features/timeline/presentation/cubit/timeline_cubit.dart';
import 'package:music_app/features/timeline/presentation/widgets/current_time_widget.dart';
import 'package:music_app/features/timeline/presentation/widgets/flexible_app_bar_space_widget.dart';
import 'package:music_app/features/timeline/presentation/widgets/timeline_memories_widget.dart';

@RoutePage()
class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          TimelineCubit(getMomentsUseCase: getIt<GetMomentsUseCase>())
            ..loadMoments(),
      child: const _TimelineScreenRoot(),
    );
  }
}

class _TimelineScreenRoot extends StatefulWidget {
  const _TimelineScreenRoot({super.key});

  @override
  State<_TimelineScreenRoot> createState() => _TimelineScreenRootState();
}

class _TimelineScreenRootState extends State<_TimelineScreenRoot> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  TimelineEntry _toTimelineEntry(MomentEntity moment) {
    final title = _summaryTitle(moment);
    return TimelineEntry(
      id: moment.id,
      time: moment.momentDate.toTimeString(),
      title: title,
      body: moment.note,
      mood: null,
      location: moment.locationName,
      tags: moment.tags.map((t) => t.name).toList(),
      bookmarked: moment.isFavorite,
    );
  }

  String _summaryTitle(MomentEntity moment) {
    if (moment.title != null) return moment.title!;
    final note = moment.note;
    if (note != null) return note.substring(0, note.length.clamp(0, 50));
    return 'Khoảnh khắc';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FlexibleAppBarSpace(),
            SizedBox(height: AppSpacing.sm),
            const CurrentTimeWidget(),
            SizedBox(height: AppSpacing.sm),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                slivers: [
                  BlocBuilder<TimelineCubit, TimelineState>(
                    builder: (context, state) {
                      final moments = state.moments;
                      if (moments.isLoading && !moments.hasData) {
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        );
                      }
                      if (moments.isFailure && !moments.hasData) {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(moments.error ?? 'Đã có lỗi xảy ra'),
                                const SizedBox(height: 8),
                                TextButton(
                                  onPressed: () => context
                                      .read<TimelineCubit>()
                                      .loadMoments(),
                                  child: const Text('Thử lại'),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      if (moments.isSuccess &&
                          (moments.data?.isEmpty ?? true)) {
                        return SliverToBoxAdapter(
                          child: EmptyStateWidget(
                            onCreatePressed: () async {
                              await context.router.push(CreateMomentRoute());
                              if (context.mounted) {
                                context.read<TimelineCubit>().loadMoments();
                              }
                            },
                          ),
                        );
                      }
                      return SliverList.separated(
                        itemCount: moments.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return MemoriaTimeline(
                            entries: [_toTimelineEntry(moments.data![index])],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        children: [
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.edit),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.search),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.add),
            onPressed: () async {
              await context.router.push(CreateMomentRoute());
              if (context.mounted) context.read<TimelineCubit>().loadMoments();
            },
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: AppSpacing.xl);
  }
}

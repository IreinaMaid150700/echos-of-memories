import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/utils/extensions/screen_padding.dart';
import 'package:music_app/features/timeline/presentation/widgets/current_time_widget.dart';
import 'package:music_app/features/timeline/presentation/widgets/flexible_app_bar_space_widget.dart';
import 'package:music_app/features/timeline/presentation/widgets/timeline_memories_widget.dart';

@RoutePage()
class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TimelineScreenRoot();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .start,
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
                  SliverList.separated(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return MemoriaTimeline(entries: TimelineEntry.mock());
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
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
            onPressed: () {
              context.router.push(CreateMomentRoute());
            },
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: AppSpacing.xl);
  }
}

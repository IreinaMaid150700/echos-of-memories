part of '../screens/moment_detail_screen.dart';

class _PageIndicator extends StatelessWidget {
  const _PageIndicator();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MomentDetailCubit, MomentDetailState>(
      buildWhen: (prev, curr) =>
          prev.moment.data?.assets != curr.moment.data?.assets,
      builder: (context, state) {
        final count = state.moment.data?.assets.length ?? 0;
        if (count <= 1) return const SizedBox.shrink();
        return AnimatedSmoothIndicator(
          activeIndex: 0,
          axisDirection: Axis.horizontal,
          count: count,
          effect: const WormEffect(),
        );
      },
    );
  }
}

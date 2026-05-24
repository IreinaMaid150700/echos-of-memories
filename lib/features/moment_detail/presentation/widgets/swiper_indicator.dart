part of '../screens/moment_detail_screen.dart';

class _PageIndicator extends StatelessWidget {
  const _PageIndicator();

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: 1,
      axisDirection: Axis.horizontal,
      count: 6,
      effect: WormEffect(),
    );
  }
}

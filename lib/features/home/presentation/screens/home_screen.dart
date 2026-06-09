import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/gen/assets.gen.dart';
import 'package:music_app/core/shared/widgets/app_bottom_bar/custom_bottom_nav_bar.dart';
import 'package:music_app/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:music_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:music_app/features/home/presentation/cubit/home_state.dart';
import 'package:music_app/features/map/presentation/screens/map_screen.dart';
import 'package:music_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:music_app/features/timeline/presentation/screens/timeline_screen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const _HomeScreenRoot(),
    );
  }
}

class _HomeScreenRoot extends StatefulWidget {
  const _HomeScreenRoot();

  @override
  State<_HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<_HomeScreenRoot> {
  static const _tabs = <Widget>[
    TimelineScreen(),
    CalendarScreen(),
    MapScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Scaffold(
        extendBody: true,
        // Mọi tab luôn mounted (giữ state: camera bản đồ, scroll, cubit) nhưng
        // vẫn fade + slide nhẹ khi chuyển tab. Tab không active bị tắt touch.
        body: Stack(
          children: [
            for (var i = 0; i < _tabs.length; i++)
              _AnimatedTab(
                isActive: state.currentTab == i,
                child: _tabs[i],
              ),
          ],
        ),
        bottomNavigationBar: const _HomeBottomNavigationBar(),
      ),
    );
  }
}

class _AnimatedTab extends StatelessWidget {
  final bool isActive;
  final Widget child;

  const _AnimatedTab({required this.isActive, required this.child});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isActive,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        opacity: isActive ? 1 : 0,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          offset: isActive ? Offset.zero : const Offset(0.02, 0),
          child: child,
        ),
      ),
    );
  }
}

class _HomeBottomNavigationBar extends StatelessWidget {
  const _HomeBottomNavigationBar();

  static List<CustomNavItem> get _items => [
    CustomNavItem(iconPath: Assets.icons.icTimeline, label: 'Timeline'),
    CustomNavItem(iconPath: Assets.icons.icSearch, label: 'Calendar'),
    CustomNavItem(iconPath: Assets.icons.icMap, label: 'Map'),
    CustomNavItem(iconPath: Assets.icons.icSetting, label: 'Setting'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, int>(
      selector: (state) => state.currentTab,
      builder: (context, currentTab) {
        return CustomBottomNavBar(
          currentIndex: currentTab,
          items: _items,
          onTap: (index) => context.read<HomeCubit>().onChangeBottomBar(index),
        );
      },
    );
  }
}

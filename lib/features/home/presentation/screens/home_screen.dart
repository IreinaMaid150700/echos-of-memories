import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/core/gen/assets.gen.dart';
import 'package:music_app/core/shared/widgets/app_bottom_bar/app_bottom_bar_items.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:music_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:music_app/features/home/presentation/cubit/home_state.dart';
import 'package:music_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:music_app/features/timeline/presentation/screens/timeline_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeCubit(), child: const _HomeScreenRoot());
  }
}

class _HomeScreenRoot extends StatefulWidget {
  const _HomeScreenRoot({super.key});

  @override
  State<_HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<_HomeScreenRoot> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.02, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: _buildTabContent(state.currentTab),
        ),
        bottomNavigationBar: const _HomeBottomNavigationBar(),
      ),
    );
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return const TimelineScreen().keyed(const ValueKey('timeline'));
      case 1:
        return const CalendarScreen().keyed(const ValueKey('calendar'));
      case 2:
        return const SizedBox.shrink().keyed(const ValueKey('map'));
      case 3:
        return const SettingsScreen().keyed(const ValueKey('settings'));
      default:
        return const TimelineScreen().keyed(const ValueKey('timeline'));
    }
  }
}

class _HomeBottomNavigationBar extends StatelessWidget {
  const _HomeBottomNavigationBar();

  List<AppBottomBarItemsModels> buildHomeBottomBarItems(BuildContext context) {
    return [
      AppBottomBarItemsModels(path: Assets.icons.icTimeline, title: "Timeline"),
      AppBottomBarItemsModels(path: Assets.icons.icSearch, title: "Calendar"),
      AppBottomBarItemsModels(path: Assets.icons.icMap, title: "Map"),
      AppBottomBarItemsModels(path: Assets.icons.icSetting, title: "Setting"),
    ];
  }

  void _onTabTapped(BuildContext context, int index) {
    context.read<HomeCubit>().onChangeBottomBar(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, int>(
      selector: (state) => state.currentTab,
      builder: (context, currentTab) {
        return SalomonBottomBar(
          currentIndex: currentTab,
          onTap: (index) => _onTabTapped(context, index),
          items: buildHomeBottomBarItems(context).mapIndexed((index, element) {
            final isActive = index == currentTab;
            return SalomonBottomBarItem(
              icon: SvgPicture.asset(
                element.path,
                color: isActive
                    ? context.themeColors.primary
                    : context.themeColors.bottomNavInactiveIcon,
              ),
              title: Text(
                element.title,
                style: TextStyle(
                  color: isActive
                      ? context.themeColors.primary
                      : context.themeColors.bottomNavInactiveLabel,
                ),
              ),
              selectedColor: context.themeColors.bottomNavActiveBackground,
              unselectedColor: context.themeColors.bottomNavBackground,
            );
          }).toList(),
        );
      },
    );
  }
}

extension WidgetKeyed on Widget {
  Widget keyed(Key key) => KeyedSubtree(key: key, child: this);
}

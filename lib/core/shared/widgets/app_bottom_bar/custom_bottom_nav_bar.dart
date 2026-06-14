import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';

class CustomNavItem {
  final String iconPath;
  final String label;

  const CustomNavItem({required this.iconPath, required this.label});
}

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final List<CustomNavItem> items;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _scaleAnims;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.items.length,
      (_) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 520),
      ),
    );

    _scaleAnims = _controllers.map((c) {
      return TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween(
            begin: 1.0,
            end: 0.74,
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 18,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 0.74,
            end: 1.26,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 44,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 1.26,
            end: 0.93,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 22,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 0.93,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 16,
        ),
      ]).animate(c);
    }).toList();
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onTap(int index) {
    _controllers[index].forward(from: 0.0);
    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.fromLTRB(16, 8, 16, 12 + bottomPadding),
      child: Container(
        height: 66,
        decoration: BoxDecoration(
          color: colors.bottomNavBackground,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.11),
              blurRadius: 28,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = constraints.maxWidth / widget.items.length;
              final indicatorLeft =
                  itemWidth * widget.currentIndex + (itemWidth - 24) / 2;

              return Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  // Sliding indicator pill at top
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    top: 0,
                    left: indicatorLeft,
                    child: Container(
                      width: 24,
                      height: 3,
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(3),
                        ),
                      ),
                    ),
                  ),
                  // Nav items
                  Row(
                    children: List.generate(widget.items.length, (index) {
                      final item = widget.items[index];
                      final isActive = index == widget.currentIndex;

                      return Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => _onTap(index),
                          child: AnimatedBuilder(
                            animation: _scaleAnims[index],
                            builder: (context, _) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 8),
                                  Transform.scale(
                                    scale: _scaleAnims[index].value,
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 260,
                                      ),
                                      curve: Curves.easeInOut,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: isActive ? 14 : 10,
                                        vertical: isActive ? 7 : 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isActive
                                            ? colors.bottomNavActiveBackground
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: SvgPicture.asset(
                                        item.iconPath,
                                        width: 20,
                                        height: 20,
                                        colorFilter: ColorFilter.mode(
                                          isActive
                                              ? colors.primary
                                              : colors.bottomNavInactiveIcon,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  AnimatedDefaultTextStyle(
                                    duration: const Duration(milliseconds: 200),
                                    style: TextStyle(
                                      fontFamily: 'Be Vietnam Pro',
                                      fontSize: 10,
                                      fontWeight: isActive
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                      color: isActive
                                          ? colors.primary
                                          : colors.bottomNavInactiveLabel,
                                      height: 1,
                                    ),
                                    child: Text(item.label),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

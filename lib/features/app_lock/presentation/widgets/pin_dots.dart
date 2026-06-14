import 'package:flutter/material.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';

/// Row of [length] dots that fill in as the user types their PIN.
class PinDots extends StatelessWidget {
  final int filled;
  final int length;
  final bool error;

  const PinDots({
    super.key,
    required this.filled,
    this.length = 6,
    this.error = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    final activeColor = error ? colors.dangerText : colors.primary;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (i) {
        final isFilled = i < filled;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled ? activeColor : Colors.transparent,
            border: Border.all(
              color: isFilled ? activeColor : colors.borderDefault,
              width: 1.5,
            ),
          ),
        );
      }),
    );
  }
}

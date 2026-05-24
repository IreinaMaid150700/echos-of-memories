import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:music_app/core/gen/assets.gen.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';

class FlexibleAppBarSpace extends StatelessWidget {
  const FlexibleAppBarSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.icons.icHomeHeader),
            Gap(AppSpacing.xxs),
            Text(
              'Echoes of Memories',
              style: context.textTheme.headlineLarge?.copyWith(
                color: context.themeColors.textPrimary,
                fontFamily: AppFonts.accent,
              ),
            ),
          ],
        ),
        Gap(AppSpacing.xxs),
        Text(
          'Những khoảnh khắc của bạn',
          style: context.textTheme.bodySmall?.copyWith(
            color: context.themeColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

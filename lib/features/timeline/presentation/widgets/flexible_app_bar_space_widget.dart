import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:music_app/core/gen/assets.gen.dart';
import 'package:music_app/core/router/app_routers.dart';
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
            Expanded(
              child: Text(
                'Echoes of Memories',
                style: context.textTheme.headlineLarge?.copyWith(
                  color: context.themeColors.textPrimary,
                  fontFamily: AppFonts.accent,
                ),
              ),
            ),
            Semantics(
              button: true,
              label: 'Tìm kiếm',
              child: GestureDetector(
                onTap: () => context.router.push(const SearchRoute()),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xxs),
                  child: SvgPicture.asset(
                    Assets.icons.icSearch,
                    width: 24,
                    height: 24,
                  ),
                ),
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';

class UnderDevelopmentDialog extends StatelessWidget {
  const UnderDevelopmentDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (_) => const UnderDevelopmentDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.themeColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        side: BorderSide(color: context.themeColors.borderSubtle, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: context.themeColors.tertiary.withValues(alpha: 0.4),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.construction_outlined,
                size: 28,
                color: context.themeColors.primary,
              ),
            ),
            const Gap(AppSpacing.lg),
            Text(
              'Tính năng đang phát triển',
              style: context.textTheme.titleMedium?.copyWith(
                color: context.themeColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(AppSpacing.sm),
            Text(
              'Phần này hiện đang được xây dựng.\nCảm ơn bạn đã kiên nhẫn!',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.themeColors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(AppSpacing.lg),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.themeColors.primary,
                  foregroundColor: context.themeColors.surface,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                  ),
                ),
                child: Text(
                  'Đã hiểu',
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.themeColors.surface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

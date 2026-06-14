part of '../create_moment_screen.dart';

class _TitleInputSection extends StatelessWidget {
  const _TitleInputSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tiêu đề',
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.themeColors.textMuted,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.11,
            ),
          ),
          const Gap(AppSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: context.themeColors.surface.withValues(alpha: 0.82),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: context.themeColors.borderSubtle),
            ),
            child: TextField(
              onChanged: context.read<CreateMomentCubit>().onChangeTitle,
              maxLines: 1,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.themeColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: 'Đặt tên cho khoảnh khắc này...',
                hintStyle: context.textTheme.bodyLarge?.copyWith(
                  color: context.themeColors.textMuted,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

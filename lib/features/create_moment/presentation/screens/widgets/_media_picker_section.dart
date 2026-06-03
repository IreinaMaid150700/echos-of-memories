part of '../create_moment_screen.dart';

class _MediaPickerSection extends StatelessWidget {
  const _MediaPickerSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ký ức bằng hình ảnh',
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.themeColors.textMuted,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.11,
                ),
              ),
              const Gap(AppSpacing.xxs),
              Text(
                'Thêm ít nhất một tấm ảnh',
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.themeColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        const Gap(AppSpacing.md),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Row(
            children: [
              Expanded(flex: 3, child: _CoverCard()),
              const Gap(AppSpacing.sm),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _AddPhotoButton(
                      onTap: () =>
                          context.read<CreateMomentCubit>().openImagePicker(),
                    ),
                    const Gap(AppSpacing.sm),
                    const SizedBox(
                      height: 54,
                      child: Row(
                        children: [
                          Expanded(child: _MiniThumb()),
                          Gap(AppSpacing.xs),
                          Expanded(child: _MiniThumb()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CoverCard extends StatelessWidget {
  const _CoverCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 228,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.themeColors.primary.withValues(alpha: 0.3),
            context.themeColors.secondary.withValues(alpha: 0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 40,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            bottom: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: context.themeColors.surface.withValues(alpha: 0.86),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('✦', style: TextStyle(fontSize: 12)),
                  const Gap(AppSpacing.xxs),
                  Text(
                    'Ảnh bìa',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.themeColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddPhotoButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddPhotoButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.themeColors.surface.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(
            color: context.themeColors.borderSubtle,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: context.themeColors.tertiary,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add, size: 24, color: context.themeColors.primary),
        ),
      ),
    );
  }
}

class _MiniThumb extends StatelessWidget {
  const _MiniThumb();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.themeColors.tertiary.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    );
  }
}

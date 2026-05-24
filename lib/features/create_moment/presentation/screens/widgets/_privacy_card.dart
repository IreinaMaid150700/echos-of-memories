part of '../create_moment_screen.dart';

class _PrivacyCard extends StatelessWidget {
  const _PrivacyCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.themeColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: context.themeColors.borderSubtle),
      ),
      child: Column(
        children: [
          _PrivacyToggleRow(
            icon: Icons.visibility_off_outlined,
            title: 'Ẩn khỏi widget',
            value: false,
            onChanged: (_) {},
          ),
          Divider(height: 1, color: context.themeColors.borderSubtle),
          _PrivacyToggleRow(
            icon: Icons.favorite_outline,
            title: 'Đánh dấu yêu thích',
            value: false,
            onChanged: (_) {},
          ),
          Divider(height: 1, color: context.themeColors.borderSubtle),
          const _PrivacyToggleWithPrompt(),
        ],
      ),
    );
  }
}

class _PrivacyToggleRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _PrivacyToggleRow({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          _PrivacyIconContainer(icon: icon),
          const Gap(AppSpacing.sm),
          Expanded(
            child: Text(
              title,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.themeColors.textPrimary,
              ),
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeTrackColor: context.themeColors.primary,
          ),
        ],
      ),
    );
  }
}

class _PrivacyToggleWithPrompt extends StatefulWidget {
  const _PrivacyToggleWithPrompt();

  @override
  State<_PrivacyToggleWithPrompt> createState() =>
      _PrivacyToggleWithPromptState();
}

class _PrivacyToggleWithPromptState extends State<_PrivacyToggleWithPrompt> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateMomentCubit, CreateMomentState>(
      buildWhen: (prev, curr) => prev.isLockMoment != curr.isLockMoment,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                children: [
                  const _PrivacyIconContainer(icon: Icons.lock_outlined),
                  const Gap(AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'Khóa khoảnh khắc này',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.themeColors.textPrimary,
                      ),
                    ),
                  ),
                  Switch.adaptive(
                    value: state.isLockMoment,
                    onChanged: context
                        .read<CreateMomentCubit>()
                        .toggleLockedMoment,
                    activeTrackColor: context.themeColors.primary,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Text(
                'PIN chưa được thiết lập. Vào Cài đặt để đặt PIN.',
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.themeColors.textMuted,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PrivacyIconContainer extends StatelessWidget {
  final IconData icon;

  const _PrivacyIconContainer({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: context.themeColors.tertiary.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: context.themeColors.textSecondary),
    );
  }
}

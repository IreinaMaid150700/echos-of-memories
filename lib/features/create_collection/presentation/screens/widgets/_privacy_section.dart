part of '../create_collection_screen.dart';

class _PrivacySection extends StatelessWidget {
  const _PrivacySection();

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Riêng tư'),
        const Gap(AppSpacing.sm),
        Container(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: colors.borderSubtle),
          ),
          child: Column(
            children: [
              BlocSelector<CreateCollectionCubit, CreateCollectionState, bool>(
                selector: (state) => state.isPrivate,
                builder: (context, isPrivate) {
                  return _CollectionToggleRow(
                    icon: Icons.lock_outline_rounded,
                    title: 'Chỉ riêng mình',
                    subtitle: 'Không bao giờ rời thiết bị này',
                    value: isPrivate,
                    onChanged: context
                        .read<CreateCollectionCubit>()
                        .togglePrivate,
                  );
                },
              ),
              Divider(height: 1, color: colors.borderSubtle),
              BlocSelector<CreateCollectionCubit, CreateCollectionState, bool>(
                selector: (state) => state.isPinned,
                builder: (context, isPinned) {
                  return _CollectionToggleRow(
                    icon: Icons.push_pin_outlined,
                    title: 'Ghim lên đầu',
                    subtitle: 'Album hiện lên ngay đầu danh sách',
                    value: isPinned,
                    onChanged: context
                        .read<CreateCollectionCubit>()
                        .togglePinned,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CollectionToggleRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _CollectionToggleRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors.privacyChipBackground,
              shape: BoxShape.circle,
              border: Border.all(color: colors.privacyChipBorder),
            ),
            child: Icon(icon, size: 18, color: colors.privacyChipForeground),
          ),
          const Gap(AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: colors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          _CollectionSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _CollectionSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const _CollectionSwitch({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 48,
        height: 28,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: value ? colors.primary : colors.borderDefault,
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.18),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

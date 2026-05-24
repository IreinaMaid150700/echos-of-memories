part of '../screens/moment_detail_screen.dart';

class _WidgetPrivacyCard extends StatelessWidget {
  const _WidgetPrivacyCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MomentDetailCubit, MomentDetailState>(
      buildWhen: (previous, current) {
        if (previous.isEnablePinOnTop != current.isEnablePinOnTop) {
          return true;
        }
        if (previous.isHideFromWidget != current.isHideFromWidget) {
          return true;
        }
        return false;
      },
      builder: (context, state) => _SectionCard(
        title: 'WIDGET & PRIVACY',
        child: Column(
          children: [
            Divider(height: 1, color: context.themeColors.borderSubtle),
            _SwitchRow(
              icon: Icons.push_pin_outlined,
              title: 'Pin to top',
              subtitle: 'Stays at the top of your timeline',
              value: state.isEnablePinOnTop,
              onChanged: context.read<MomentDetailCubit>().togglePinOnTop,
            ),
            Divider(height: 1, color: context.themeColors.borderSubtle),
            _SwitchRow(
              icon: Icons.visibility_off_outlined,
              title: 'Hide from widget',
              subtitle: "Won't appear on your home screen widget",
              value: state.isHideFromWidget,
              onChanged: context.read<MomentDetailCubit>().toggleHideFromWidget,
            ),
          ],
        ),
      ),
    );
  }
}

class _SwitchRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final Function(bool) onChanged;

  const _SwitchRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          _IconBackground(icon: icon),
          const Gap(AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.themeColors.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.themeColors.textMuted,
                  ),
                ),
              ],
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

class _IconBackground extends StatelessWidget {
  final IconData icon;

  const _IconBackground({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: context.themeColors.tertiary.withValues(alpha: 0.4),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: context.themeColors.textSecondary),
    );
  }
}

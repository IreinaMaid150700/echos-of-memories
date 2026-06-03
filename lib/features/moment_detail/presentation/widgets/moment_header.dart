part of '../screens/moment_detail_screen.dart';

class _MomentHeader extends StatelessWidget {
  const _MomentHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          const _BackButton(),
          const Expanded(child: _DateTitle()),
          const _ActionIcons(),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.router.maybePop(),
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: context.themeColors.textPrimary,
        size: 20,
      ),
    );
  }
}

class _DateTitle extends StatelessWidget {
  const _DateTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MomentDetailCubit, MomentDetailState>(
      buildWhen: (prev, curr) => prev.moment != curr.moment,
      builder: (context, state) {
        final moment = state.moment.data;
        final date = moment?.momentDate ?? DateTime.now();
        final dayMonthStr = DateFormat('MMM d').format(date);
        final weekdayStr = DateFormat('EEEE').format(date).toUpperCase();
        final timeStr = date.toTimeString();

        return Column(
          children: [
            Text(
              dayMonthStr,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.themeColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(2),
            Text(
              '$weekdayStr · $timeStr',
              style: context.textTheme.labelMedium?.copyWith(
                color: context.themeColors.textMuted,
                letterSpacing: 0.5,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ActionIcons extends StatelessWidget {
  const _ActionIcons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _CircleIcon(
          icon: Icons.favorite_outline,
          color: context.themeColors.primary,
        ),
        const Gap(AppSpacing.xs),
        _CircleIcon(
          icon: Icons.more_horiz,
          color: context.themeColors.textSecondary,
        ),
      ],
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _CircleIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: context.themeColors.tertiary.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: color),
    );
  }
}

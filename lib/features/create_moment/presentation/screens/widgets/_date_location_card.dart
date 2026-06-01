part of '../create_moment_screen.dart';

class _DateLocationCard extends StatelessWidget {
  const _DateLocationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.themeColors.surface.withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: context.themeColors.borderSubtle),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 28,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          BlocSelector<CreateMomentCubit, CreateMomentState, DateTime>(
            selector: (state) {
              return state.momentDate ?? DateTime.now();
            },
            builder: (context, momentDate) {
              return _TappableRow(
                icon: Icons.calendar_today_outlined,
                label: 'Ngày khoảnh khắc',
                value: momentDate.toVietnamese(showYear: false),
                onTap: () =>
                    context.read<CreateMomentCubit>().showDevelopmentDialog(),
              );
            },
          ),
          Divider(height: 1, color: context.themeColors.borderSubtle),
          _TappableRow(
            icon: Icons.location_on_outlined,
            label: 'Địa điểm',
            value: null,
            onTap: () =>
                context.read<CreateMomentCubit>().showDevelopmentDialog(),
          ),
        ],
      ),
    );
  }
}

class _TappableRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final VoidCallback onTap;

  const _TappableRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            _IconContainer(icon: icon),
            const Gap(AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.themeColors.textMuted,
                    ),
                  ),
                  if (value != null)
                    Text(
                      value!,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.themeColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  else
                    Text(
                      'Thêm địa điểm',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.themeColors.textMuted,
                      ),
                    ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: context.themeColors.textMuted,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  final IconData icon;

  const _IconContainer({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFEFE4D7),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: const Color(0xFF9F705A)),
    );
  }
}

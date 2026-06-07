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
          BlocSelector<CreateMomentCubit, CreateMomentState,
              ({bool loading, String? name})>(
            selector: (state) =>
                (loading: state.isPickingLocation, name: state.locationName),
            builder: (context, data) {
              return _TappableRow(
                icon: Icons.location_on_outlined,
                label: 'Địa điểm',
                value: data.loading ? 'Đang lấy vị trí...' : data.name,
                onTap: data.loading
                    ? () {}
                    : () => context
                        .read<CreateMomentCubit>()
                        .pickCurrentLocation(),
              );
            },
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
        color: context.themeColors.privacyChipBackground,
        shape: BoxShape.circle,
        border: Border.all(color: context.themeColors.privacyChipBorder),
      ),
      child: Icon(icon, size: 18, color: context.themeColors.privacyChipForeground),
    );
  }
}

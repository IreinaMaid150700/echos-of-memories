part of '../screens/moment_detail_screen.dart';
class _MemoryInfoCard extends StatelessWidget {
  const _MemoryInfoCard();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'MEMORY INFO',
      child: Column(
        children: [
          _InfoRow(
            icon: Icons.access_time_rounded,
            label: 'Moment',
            value: 'Thursday, Oct 24 · 8:15 AM',
          ),
          Divider(height: 1, color: context.themeColors.borderSubtle),
          _InfoRow(
            icon: Icons.location_on_outlined,
            label: 'Place',
            value: 'Little Bloom Café',
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
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
                  label,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.themeColors.textMuted,
                  ),
                ),
                Text(
                  value,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.themeColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
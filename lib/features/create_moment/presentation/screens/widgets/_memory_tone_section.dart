part of '../create_moment_screen.dart';

class _MemoryToneSection extends StatelessWidget {
  const _MemoryToneSection();

  static const _tones = [
    (label: 'Golden Hour', color: Color(0xFFF4C3A0)),
    (label: 'Foggy Forest', color: Color(0xFFC8D4C0)),
    (label: 'Cozy Hearth', color: Color(0xFFD9C4B0)),
    (label: 'Ocean Mist', color: Color(0xFFB8C8D4)),
    (label: 'Dusk Sky', color: Color(0xFFC8B8D4)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Text(
            'Tone',
            style: context.textTheme.labelMedium?.copyWith(
              color: context.themeColors.textMuted,
            ),
          ),
        ),
        const Gap(AppSpacing.xs),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            itemCount: _tones.length,
            separatorBuilder: (_, __) => const Gap(AppSpacing.md),
            itemBuilder: (context, index) {
              final tone = _tones[index];
              return _ToneSwatch(label: tone.label, color: tone.color);
            },
          ),
        ),
      ],
    );
  }
}

class _ToneSwatch extends StatelessWidget {
  final String label;
  final Color color;

  const _ToneSwatch({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: context.themeColors.borderSubtle,
              width: 1,
            ),
          ),
        ),
        const Gap(AppSpacing.xxs),
        Text(
          label,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.themeColors.textMuted,
          ),
        ),
      ],
    );
  }
}
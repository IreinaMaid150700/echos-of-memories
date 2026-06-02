part of '../create_moment_screen.dart';

class _MemoryToneSection extends StatelessWidget {
  const _MemoryToneSection();

  static const _tones = [
    (label: 'Golden\nHour', color: Color(0xFFF4C3A0)),
    (label: 'Foggy\nForest', color: Color(0xFFC8D4C0)),
    (label: 'Cozy\nHearth', color: Color(0xFFD9C4B0)),
    (label: 'Ocean\nMist', color: Color(0xFFB8C8D4)),
    (label: 'Dusk\nSky', color: Color(0xFFC8B8D4)),
  ];

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
                'Tone',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.themeColors.textMuted,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.11,
                ),
              ),
              const Gap(AppSpacing.xxs),
              Text(
                'Chọn sắc thái cho khoảnh khắc',
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.themeColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        const Gap(AppSpacing.sm),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            itemCount: _tones.length,
            separatorBuilder: (_, __) => const Gap(AppSpacing.sm),
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
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: context.themeColors.borderSubtle,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: context.themeColors.background.withValues(alpha: 0.5),
                blurRadius: 0,
                spreadRadius: 3,
              ),
            ],
          ),
        ),
        const Gap(AppSpacing.xs),
        Text(
          label,
          textAlign: TextAlign.center,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.themeColors.textMuted,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.03,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

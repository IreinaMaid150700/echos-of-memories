part of '../create_moment_screen.dart';

class _MemoryToneSection extends StatelessWidget {
  const _MemoryToneSection();

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
        BlocBuilder<CreateMomentCubit, CreateMomentState>(
          buildWhen: (p, c) =>
              p.tones != c.tones || p.toneIdSelected != c.toneIdSelected,
          builder: (context, state) {
            final tones = state.tones.data ?? const <ToneEntity>[];
            if (state.tones.isLoading && tones.isEmpty) {
              return const SizedBox(
                height: 100,
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              );
            }
            if (tones.isEmpty) return const SizedBox.shrink();
            return SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                itemCount: tones.length,
                separatorBuilder: (_, __) => const Gap(AppSpacing.sm),
                itemBuilder: (context, index) {
                  final tone = tones[index];
                  return _ToneSwatch(
                    label: tone.name,
                    semanticLabel: '${tone.name}, tone',
                    color: tone.lightColorHex
                        .toColor(fallback: context.themeColors.tertiary),
                    selected: state.toneIdSelected == tone.id,
                    onTap: () =>
                        context.read<CreateMomentCubit>().selectTone(tone.id),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _ToneSwatch extends StatelessWidget {
  final String label;
  final String semanticLabel;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const _ToneSwatch({
    required this.label,
    required this.semanticLabel,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: true,
      selected: selected,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: selected
                    ? context.themeColors.primary
                    : context.themeColors.borderSubtle,
                width: selected ? 2.5 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: context.themeColors.background.withValues(alpha: 0.5),
                  blurRadius: 0,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: selected
                ? Icon(
                    Icons.check,
                    size: 22,
                    color: context.themeColors.primary,
                  )
                : null,
          ),
          const Gap(AppSpacing.xs),
          SizedBox(
            width: 64,
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelSmall?.copyWith(
                color: selected
                    ? context.themeColors.primary
                    : context.themeColors.textMuted,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.03,
                height: 1.2,
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}

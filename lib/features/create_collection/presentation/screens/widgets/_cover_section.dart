part of '../create_collection_screen.dart';

class _CoverSection extends StatelessWidget {
  const _CoverSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _CoverPreview(),
        const Gap(AppSpacing.md),
        const _SectionLabel('Bìa album'),
        const Gap(AppSpacing.sm),
        SizedBox(
          height: 78,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: CollectionCover.values.length,
            separatorBuilder: (_, __) => const Gap(AppSpacing.sm),
            itemBuilder: (context, index) =>
                _CoverSwatch(cover: CollectionCover.values[index]),
          ),
        ),
      ],
    );
  }
}

class _CoverPreview extends StatelessWidget {
  const _CoverPreview();

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return BlocBuilder<CreateCollectionCubit, CreateCollectionState>(
      buildWhen: (p, c) => p.cover != c.cover || p.title != c.title,
      builder: (context, state) {
        return AspectRatio(
          aspectRatio: 16 / 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.xl),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: state.cover.gradient(colors),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 28,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xxs,
                    ),
                    decoration: BoxDecoration(
                      color: colors.surface.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.folder_outlined,
                          size: 13,
                          color: colors.textPrimary,
                        ),
                        const Gap(AppSpacing.xxs),
                        Text(
                          '0 khoảnh khắc',
                          style: context.textTheme.labelSmall?.copyWith(
                            color: colors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(AppSpacing.xs),
                  Text(
                    state.title.trim().isEmpty
                        ? 'Tên album của bạn'
                        : state.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CoverSwatch extends StatelessWidget {
  final CollectionCover cover;

  const _CoverSwatch({required this.cover});

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return BlocSelector<CreateCollectionCubit, CreateCollectionState,
        CollectionCover>(
      selector: (state) => state.cover,
      builder: (context, selected) {
        final active = selected == cover;
        return GestureDetector(
          onTap: () => context.read<CreateCollectionCubit>().selectCover(cover),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: cover.gradient(colors),
                  ),
                  border: Border.all(
                    color: active ? colors.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              const Gap(AppSpacing.xxs),
              Text(
                cover.label,
                style: context.textTheme.labelSmall?.copyWith(
                  color: active ? colors.primary : colors.textMuted,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: context.textTheme.labelSmall?.copyWith(
        color: context.themeColors.textMuted,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }
}

extension _CoverColors on CollectionCover {
  List<Color> gradient(AppCustomColors c) {
    final Color bg;
    final Color fg;
    switch (this) {
      case CollectionCover.calm:
        bg = c.moodCalmBackground;
        fg = c.moodCalmText;
      case CollectionCover.peaceful:
        bg = c.moodPeacefulBackground;
        fg = c.moodPeacefulText;
      case CollectionCover.grateful:
        bg = c.moodWarmBackground;
        fg = c.moodWarmText;
      case CollectionCover.reflective:
        bg = c.moodFocusedBackground;
        fg = c.moodFocusedText;
      case CollectionCover.focused:
        bg = c.tertiary;
        fg = c.textSecondary;
      case CollectionCover.joyful:
        bg = c.moodWarmBackground;
        fg = c.primary;
    }
    // Theo Lovable: from mood-bg → mix(mood-fg 28%, tertiary).
    final end = Color.lerp(c.tertiary, fg, 0.28)!;
    return [bg, end];
  }
}

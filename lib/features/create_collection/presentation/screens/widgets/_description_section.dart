part of '../create_collection_screen.dart';

class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection();

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Ghi chú nhỏ (tuỳ chọn)'),
        const Gap(AppSpacing.sm),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: colors.surface.withValues(alpha: 0.82),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: colors.borderSubtle),
          ),
          child: TextField(
            onChanged: context
                .read<CreateCollectionCubit>()
                .onChangeDescription,
            maxLines: 3,
            minLines: 3,
            maxLength: 180,
            style: context.textTheme.bodyMedium?.copyWith(
              color: colors.textPrimary,
              height: 1.6,
            ),
            decoration: InputDecoration(
              counterText: '',
              hintText: 'Album này để gom góp những gì?',
              hintStyle: context.textTheme.bodyMedium?.copyWith(
                color: colors.textMuted,
                height: 1.6,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}

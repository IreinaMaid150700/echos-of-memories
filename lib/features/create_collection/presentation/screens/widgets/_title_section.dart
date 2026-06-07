part of '../create_collection_screen.dart';

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  static const _maxLength = 60;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Tên album'),
        const Gap(AppSpacing.sm),
        TextField(
          onChanged: context.read<CreateCollectionCubit>().onChangeTitle,
          maxLength: _maxLength,
          textCapitalization: TextCapitalization.sentences,
          style: context.textTheme.titleLarge?.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
          buildCounter:
              (_, {required currentLength, required isFocused, maxLength}) {
                return Text(
                  '$currentLength/$maxLength',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: colors.textMuted,
                  ),
                );
              },
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Ví dụ: Những ngày bình yên',
            hintStyle: context.textTheme.titleLarge?.copyWith(
              color: colors.textMuted,
              fontWeight: FontWeight.w600,
            ),
            contentPadding: const EdgeInsets.only(bottom: AppSpacing.xs),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colors.borderSubtle),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colors.primary),
            ),
          ),
        ),
      ],
    );
  }
}

part of '../create_moment_screen.dart';

class _NoteInputSection extends StatelessWidget {
  const _NoteInputSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ghi chú',
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.themeColors.textMuted,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.11,
            ),
          ),
          const Gap(AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: context.themeColors.surface.withValues(alpha: 0.82),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: context.themeColors.borderSubtle),
            ),
            child: TextField(
              onChanged: context.read<CreateMomentCubit>().onChangeNote,
              maxLines: null,
              minLines: 4,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.themeColors.textPrimary,
                height: 1.55,
              ),
              decoration: InputDecoration(
                hintText: 'Bạn muốn nhớ điều gì về khoảnh khắc này?',
                hintStyle: context.textTheme.bodyLarge?.copyWith(
                  color: context.themeColors.textMuted,
                  height: 1.55,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

part of '../create_moment_screen.dart';

class _NoteInputSection extends StatelessWidget {
  const _NoteInputSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: TextField(
        maxLines: null,
        minLines: 4,
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.themeColors.textPrimary,
          height: 1.6,
        ),
        decoration: InputDecoration(
          hintText: 'Bạn muốn nhớ điều gì về khoảnh khắc này?',
          hintStyle: context.textTheme.bodyLarge?.copyWith(
            color: context.themeColors.textMuted,
            height: 1.6,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

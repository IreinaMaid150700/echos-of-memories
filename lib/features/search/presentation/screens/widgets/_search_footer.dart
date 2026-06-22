part of '../search_screen.dart';

class _SearchFooter extends StatelessWidget {
  const _SearchFooter();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '· Mọi tìm kiếm đều ở trên thiết bị của bạn ·',
        textAlign: TextAlign.center,
        style: context.textTheme.labelSmall?.copyWith(
          color: context.themeColors.textMuted,
          fontSize: 11,
        ),
      ),
    );
  }
}

part of '../create_moment_screen.dart';

class _CreateAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CreateAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.themeColors.surface,
      elevation: 0,
      leading: IconButton(
        onPressed: () => context.router.maybePop(),
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: context.themeColors.textPrimary,
          size: 20,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Lưu một khoảnh khắc',
        style: context.textTheme.headlineMedium?.copyWith(
          color: context.themeColors.textPrimary,
        ),
      ),
    );
  }
}

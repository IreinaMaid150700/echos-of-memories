part of '../create_collection_screen.dart';

class _CreateCollectionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _CreateCollectionAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.themeColors.background,
      elevation: 0,
      leading: IconButton(
        onPressed: () => context.router.maybePop(),
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: context.themeColors.textSecondary,
          size: 20,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Album mới',
        style: context.textTheme.titleMedium?.copyWith(
          color: context.themeColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

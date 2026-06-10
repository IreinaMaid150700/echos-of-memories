part of '../create_collection_screen.dart';

class _BottomActionBar extends StatelessWidget {
  const _BottomActionBar();

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Container(
      padding: EdgeInsets.only(
        left: AppSpacing.xl,
        right: AppSpacing.xl,
        top: AppSpacing.md,
        bottom: MediaQuery.of(context).padding.bottom + AppSpacing.md,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colors.background.withValues(alpha: 0), colors.background],
          stops: const [0.0, 0.4],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => context.router.maybePop(),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
                backgroundColor: colors.surface,
                foregroundColor: colors.textSecondary,
                side: BorderSide(color: colors.borderSubtle),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
              ),
              child: Text(
                'Huỷ',
                style: context.textTheme.titleSmall?.copyWith(
                  color: colors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const Gap(AppSpacing.sm),
          Expanded(
            flex: 2,
            child:
                BlocSelector<
                  CreateCollectionCubit,
                  CreateCollectionState,
                  bool
                >(
                  selector: (state) => state.canSave,
                  builder: (context, canSave) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.full),
                        boxShadow: canSave
                            ? [
                                BoxShadow(
                                  color: colors.primary.withValues(alpha: 0.34),
                                  blurRadius: 28,
                                  offset: const Offset(0, 12),
                                ),
                              ]
                            : null,
                      ),
                      child: ElevatedButton(
                        onPressed: canSave
                            ? () => context.router.maybePop()
                            : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(52),
                          backgroundColor: colors.primary,
                          disabledBackgroundColor: colors.tertiary,
                          foregroundColor: Colors.white,
                          disabledForegroundColor: colors.textMuted,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppRadius.full),
                          ),
                        ),
                        child: Text(
                          'Tạo album',
                          style: context.textTheme.titleSmall?.copyWith(
                            color: canSave ? Colors.white : colors.textMuted,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}

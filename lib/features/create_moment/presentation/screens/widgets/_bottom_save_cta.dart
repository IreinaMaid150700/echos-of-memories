part of '../create_moment_screen.dart';

class _BottomSaveCta extends StatelessWidget {
  const _BottomSaveCta();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateMomentCubit, CreateMomentState>(
      listenWhen: (prev, curr) => prev.saveAction != curr.saveAction,
      listener: (context, state) {
        if (state.saveAction.isSuccess && context.mounted) {
          context.router.maybePop();
        }
      },
      builder: (context, state) {
        final isSaving = state.saveAction.isLoading;
        final isEnabled = !isSaving &&
            ((state.note?.trim().isNotEmpty ?? false) || state.tagsSelected.isNotEmpty);
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
              colors: [
                context.themeColors.background.withValues(alpha: 0),
                context.themeColors.background,
              ],
              stops: const [0.0, 0.3],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: 54,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        context.themeColors.primary,
                        context.themeColors.primary.withValues(alpha: 0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                    boxShadow: [
                      BoxShadow(
                        color: context.themeColors.primary.withValues(alpha: 0.34),
                        blurRadius: 34,
                        offset: const Offset(0, 14),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: isEnabled
                        ? () => context.read<CreateMomentCubit>().saveMoment()
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                    ),
                    child: isSaving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Lưu lại khoảnh khắc',
                            style: context.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                  ),
                ),
              ),
              const Gap(AppSpacing.xs),
              Text(
                '· Lưu riêng tư trên thiết bị này ·',
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.themeColors.textMuted,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

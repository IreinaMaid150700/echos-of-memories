part of '../create_moment_screen.dart';

class _BottomSaveCta extends StatelessWidget {
  const _BottomSaveCta();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateMomentCubit, CreateMomentState>(
      builder: (context, state) {
        final isEnabled = false;
        return Container(
          padding: EdgeInsets.only(
            left: AppSpacing.xl,
            right: AppSpacing.xl,
            top: AppSpacing.md,
            bottom: MediaQuery.of(context).padding.bottom + AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: context.themeColors.background,
            border: Border(
              top: BorderSide(
                color: context.themeColors.borderSubtle,
                width: 1,
              ),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: isEnabled ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isEnabled
                    ? context.themeColors.primary
                    : context.themeColors.primary.withValues(alpha: 0.5),
                foregroundColor: context.themeColors.surface,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
              ),
              child: Text(
                'Lưu lại',
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.themeColors.surface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

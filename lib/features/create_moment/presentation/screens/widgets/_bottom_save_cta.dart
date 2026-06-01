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
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.themeColors.background,
                context.themeColors.background.withValues(alpha: 0),
              ],
              stops: const [0.7, 1.0],
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
                        const Color(0xFFDC8669),
                        const Color(0xFFC96C53),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFC96C53).withValues(alpha: 0.34),
                        blurRadius: 34,
                        offset: const Offset(0, 14),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: isEnabled ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                    ),
                    child: Text(
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

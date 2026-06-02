part of '../screens/moment_detail_screen.dart';

class _DeleteCard extends StatelessWidget {
  const _DeleteCard();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MomentDetailCubit, MomentDetailState>(
      listenWhen: (prev, curr) =>
          prev.deleteAction != curr.deleteAction ||
          prev.showDeleteConfirm != curr.showDeleteConfirm,
      listener: (context, state) async {
        if (state.showDeleteConfirm) {
          final id = state.moment.data?.id;
          final confirmed = await showDialog<bool>(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Xoá khoảnh khắc?'),
              content: const Text(
                "Sẽ gỡ khỏi dòng thời gian. Không thể hoàn tác.",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Huỷ'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Xoá'),
                ),
              ],
            ),
          );
          if (context.mounted) {
            context.read<MomentDetailCubit>().dismissDeleteConfirm();
          }
          if (confirmed == true && id != null && context.mounted) {
            context.read<MomentDetailCubit>().deleteMoment(id);
          }
        }

        if (state.deleteAction.isSuccess && content.mounted) context.router.maybePop();
      },
      builder: (context, state) {
        final momentId = state.moment.data?.id;
        return GestureDetector(
          onTap: momentId != null
              ? () => context.read<MomentDetailCubit>().toggleDeleteConfirm()
              : null,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: context.themeColors.dangerBackground.withValues(
                alpha: 0.15,
              ),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(
                color: context.themeColors.dangerText.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      size: 18,
                      color: context.themeColors.dangerText,
                    ),
                    const Gap(AppSpacing.xs),
                    Text(
                      'Delete this memory',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.themeColors.dangerText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Gap(AppSpacing.xxs),
                Text(
                  "Removed gently from your timeline. This can't be undone.",
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.themeColors.dangerText.withValues(
                      alpha: 0.8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

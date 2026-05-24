part of '../create_moment_screen.dart';

class _MediaPickerSection extends StatelessWidget {
  const _MediaPickerSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            children: [
              _AddMediaButton(
                onTap: () =>
                    context.read<CreateMomentCubit>().openImagePicker(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: AppSpacing.xl,
            top: AppSpacing.xs,
          ),
          child: Text(
            'Thêm ảnh',
            style: context.textTheme.labelMedium?.copyWith(
              color: context.themeColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }
}

class _AddMediaButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddMediaButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 140,
        margin: const EdgeInsets.only(right: AppSpacing.sm),
        decoration: BoxDecoration(
          color: context.themeColors.surfaceElevated,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(
            color: context.themeColors.borderSubtle,
            width: 1,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.add_photo_alternate_outlined,
            size: 32,
            color: context.themeColors.textMuted,
          ),
        ),
      ),
    );
  }
}

part of '../create_moment_screen.dart';

class _MediaPickerSection extends StatelessWidget {
  const _MediaPickerSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ký ức bằng hình ảnh',
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.themeColors.textMuted,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.11,
                ),
              ),
              const Gap(AppSpacing.xxs),
              Text(
                'Thêm ảnh cho khoảnh khắc',
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.themeColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        const Gap(AppSpacing.md),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: BlocSelector<CreateMomentCubit, CreateMomentState, List<File>>(
            selector: (state) => state.imagePicker,
            builder: (context, images) {
              final cubit = context.read<CreateMomentCubit>();
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _CoverCard(
                      cover: images.isNotEmpty ? images.first : null,
                    ),
                  ),
                  const Gap(AppSpacing.sm),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        _AddPhotoButton(onTap: cubit.openImagePicker),
                        const Gap(AppSpacing.sm),
                        SizedBox(
                          height: 54,
                          child: Row(
                            children: [
                              Expanded(
                                child: _Thumb(
                                  file: images.length > 1 ? images[1] : null,
                                  onRemove: images.length > 1
                                      ? () => cubit.removeImageAt(1)
                                      : null,
                                ),
                              ),
                              const Gap(AppSpacing.xs),
                              Expanded(
                                child: _Thumb(
                                  file: images.length > 2 ? images[2] : null,
                                  extraCount: images.length > 3
                                      ? images.length - 3
                                      : 0,
                                  onRemove: images.length > 2
                                      ? () => cubit.removeImageAt(2)
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CoverCard extends StatelessWidget {
  final File? cover;
  const _CoverCard({this.cover});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 228,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: cover == null
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.themeColors.primary.withValues(alpha: 0.3),
                  context.themeColors.secondary.withValues(alpha: 0.3),
                ],
              )
            : null,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 40,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (cover != null) Image.file(cover!, fit: BoxFit.cover),
          Positioned(
            left: 16,
            bottom: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: context.themeColors.surface.withValues(alpha: 0.86),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('✦', style: TextStyle(fontSize: 12)),
                  const Gap(AppSpacing.xxs),
                  Text(
                    'Ảnh bìa',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.themeColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddPhotoButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddPhotoButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.themeColors.surface.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(
            color: context.themeColors.borderSubtle,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: context.themeColors.tertiary,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add, size: 24, color: context.themeColors.primary),
        ),
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  final File? file;
  final int extraCount;
  final VoidCallback? onRemove;

  const _Thumb({this.file, this.extraCount = 0, this.onRemove});

  @override
  Widget build(BuildContext context) {
    if (file == null) {
      return Container(
        decoration: BoxDecoration(
          color: context.themeColors.tertiary.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      );
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: Image.file(file!, fit: BoxFit.cover),
        ),
        if (extraCount > 0)
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            alignment: Alignment.center,
            child: Text(
              '+$extraCount',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        if (onRemove != null)
          Positioned(
            right: 2,
            top: 2,
            child: GestureDetector(
              onTap: onRemove,
              child: const CircleAvatar(
                radius: 9,
                backgroundColor: Colors.black54,
                child: Icon(Icons.close, size: 12, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}

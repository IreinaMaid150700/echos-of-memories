part of '../create_moment_screen.dart';

class _PrivacyCard extends StatelessWidget {
  const _PrivacyCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.themeColors.surface.withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: context.themeColors.borderSubtle),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 28,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          BlocSelector<CreateMomentCubit, CreateMomentState, bool>(
            selector: (state) {
              return state.hideFromWidget;
            },
            builder: (context, hideFromWidget) {
              return _PrivacyToggleRow(
                icon: Icons.visibility_off_outlined,
                title: 'Ẩn khỏi widget',
                subtitle: 'Không xuất hiện ngoài màn hình chính',
                value: hideFromWidget,
                onChanged: context.read<CreateMomentCubit>().toggleHiddenWidget,
              );
            },
          ),
          Divider(height: 1, color: context.themeColors.borderSubtle),
          BlocSelector<CreateMomentCubit, CreateMomentState, bool>(
            selector: (state) {
              return state.isLoved;
            },
            builder: (context, isLoved) {
              return _PrivacyToggleRow(
                icon: Icons.favorite_outline,
                title: 'Đánh dấu yêu thích',
                subtitle: 'Lưu vào những ký ức được yêu',
                value: isLoved,
                onChanged: context.read<CreateMomentCubit>().toggleLoved,
              );
            },
          ),
          Divider(height: 1, color: context.themeColors.borderSubtle),
          const _PrivacyToggleWithPrompt(),
        ],
      ),
    );
  }
}

class _PrivacyToggleRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _PrivacyToggleRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          _PrivacyIconContainer(icon: icon),
          const Gap(AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.themeColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.themeColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          _CustomSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const _CustomSwitch({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 48,
        height: 28,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: value ? context.themeColors.primary : const Color(0xFFD7C9BF),
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.18),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PrivacyToggleWithPrompt extends StatefulWidget {
  const _PrivacyToggleWithPrompt();

  @override
  State<_PrivacyToggleWithPrompt> createState() =>
      _PrivacyToggleWithPromptState();
}

class _PrivacyToggleWithPromptState extends State<_PrivacyToggleWithPrompt> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateMomentCubit, CreateMomentState>(
      buildWhen: (prev, curr) => prev.isLockMoment != curr.isLockMoment,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                children: [
                  const _PrivacyIconContainer(icon: Icons.lock_outlined),
                  const Gap(AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'Khóa khoảnh khắc này',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.themeColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _CustomSwitch(
                    value: state.isLockMoment,
                    onChanged: (_) =>
                        context.read<CreateMomentCubit>().toggleLockedMoment,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 68,
                right: AppSpacing.md,
                bottom: AppSpacing.md,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PIN chưa được thiết lập. Bạn có thể tạo PIN trong phần Cài đặt riêng tư.',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.themeColors.textMuted,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PrivacyIconContainer extends StatelessWidget {
  final IconData icon;

  const _PrivacyIconContainer({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFEFE4D7),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: const Color(0xFF9F705A)),
    );
  }
}

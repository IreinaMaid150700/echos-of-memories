part of '../create_moment_screen.dart';

class _TagInputSection extends StatefulWidget {
  const _TagInputSection();

  @override
  State<_TagInputSection> createState() => _TagInputSectionState();
}

class _TagInputSectionState extends State<_TagInputSection> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final List<String> _tags = [];

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _addTag(String value) {
    final tag = value.trim().replaceAll('#', '').replaceAll(',', '');
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() => _tags.add(tag));
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tags',
          style: context.textTheme.labelMedium?.copyWith(
            color: context.themeColors.textMuted,
          ),
        ),
        const Gap(AppSpacing.sm),
        if (_tags.isNotEmpty) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: _tags
                    .map(
                      (tag) => _TagChip(
                        label: tag,
                        onRemove: () => setState(() => _tags.remove(tag)),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
        _InlineTagInput(
          controller: _controller,
          focusNode: _focusNode,
          onTagSubmitted: _addTag,
        ),
      ],
    );
  }
}

class _InlineTagInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onTagSubmitted;

  const _InlineTagInput({
    required this.controller,
    required this.focusNode,
    required this.onTagSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: context.themeColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: context.themeColors.borderSubtle),
      ),
      child: Row(
        children: [
          Icon(
            Icons.tag_outlined,
            size: 16,
            color: context.themeColors.textMuted,
          ),
          const Gap(AppSpacing.xs),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.themeColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: 'Thêm tag...',
                hintStyle: context.textTheme.bodySmall?.copyWith(
                  color: context.themeColors.textMuted,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              onSubmitted: onTagSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _TagChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.themeColors.secondary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '#$label',
            style: context.textTheme.labelSmall?.copyWith(
              color: context.themeColors.secondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(AppSpacing.xxs),
          GestureDetector(
            onTap: onRemove,
            child: Icon(
              Icons.close,
              size: 12,
              color: context.themeColors.secondary.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}

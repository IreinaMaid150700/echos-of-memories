part of '../create_moment_screen.dart';

class _TagInputSection extends StatelessWidget {
  const _TagInputSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _TagEyebrow(),
        const Gap(AppSpacing.lg),
        const _SelectedTagsRow(),
        const Gap(AppSpacing.sm),

        const _TagInputShell(),
        const Gap(AppSpacing.sm),
        const _SuggestionsPanel(),
      ],
    );
  }
}

class _TagEyebrow extends StatelessWidget {
  const _TagEyebrow();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Tags',
      style: context.textTheme.bodyLarge?.copyWith(
        color: context.themeColors.textMuted,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.11,
      ),
    );
  }
}

class _SelectedTagsRow extends StatelessWidget {
  const _SelectedTagsRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateMomentCubit, CreateMomentState>(
      buildWhen: (prev, curr) => prev.tagsSelected != curr.tagsSelected,
      builder: (context, state) {
        if (state.tagsSelected.isEmpty) {
          return const SizedBox.shrink();
        }
        return Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: state.tagsSelected
              .map(
                (tag) => _TagChip(
                  label: tag.name,
                  onRemove: () =>
                      context.read<CreateMomentCubit>().removeTag(tag.id),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _TagInputShell extends StatefulWidget {
  const _TagInputShell();

  @override
  State<_TagInputShell> createState() => _TagInputShellState();
}

class _TagInputShellState extends State<_TagInputShell> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    _controller.addListener(_onTextChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _controller.removeListener(_onTextChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      _onFocusLost();
    }
  }

  void _onTextChange() {
    context.read<CreateMomentCubit>().updateInputText(_controller.text);
  }

  void _onFocusLost() {
    final tagName = _controller.text.trim();
    if (tagName.isNotEmpty) {
      context.read<CreateMomentCubit>().addTag(tagName);
      _controller.clear();
      context.read<CreateMomentCubit>().updateInputText('');
    }
  }

  void _clearInput() {
    _controller.clear();
    context.read<CreateMomentCubit>().updateInputText('');
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      constraints: const BoxConstraints(minHeight: 58),
      decoration: BoxDecoration(
        color: context.themeColors.surface.withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: context.themeColors.borderSubtle),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFF8E5DA),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '#',
                style: TextStyle(
                  color: context.themeColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'JetBrainsMono',
                ),
              ),
            ),
          ),
          const Gap(AppSpacing.sm),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.themeColors.textPrimary,
              ),

              decoration: InputDecoration(
                hintText: 'Thêm tag...',
                hintStyle: context.textTheme.bodySmall?.copyWith(
                  color: context.themeColors.textMuted,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
              ),

              onTapOutside: (_) => _onFocusLost(),
              onSubmitted: (_) => _onFocusLost(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ClearButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _ClearButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: context.themeColors.textMuted.withValues(alpha: 0.5),
            width: 1.5,
          ),
        ),
        child: Icon(
          Icons.close,
          size: 12,
          color: context.themeColors.textMuted,
        ),
      ),
    );
  }
}

class _SuggestionsPanel extends StatelessWidget {
  const _SuggestionsPanel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateMomentCubit, CreateMomentState>(
      buildWhen: (prev, curr) =>
          prev.tagsSuggestions != curr.tagsSuggestions ||
          prev.tagsSelected != curr.tagsSelected ||
          prev.inputText != curr.inputText,
      builder: (context, state) {
        final suggestions = state.tagsSuggestions.data ?? [];
        final selectedIds = state.tagsSelected.map((t) => t.id).toSet();
        final filtered = suggestions
            .where((t) => !selectedIds.contains(t.id))
            .where((t) => t.name.contains(state.inputText.toLowerCase()))
            .take(5)
            .toList();

        if (filtered.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: context.themeColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(
              color: context.themeColors.borderSubtle.withValues(alpha: 0.78),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: filtered
                    .map(
                      (tag) => _SuggestionChip(
                        label: tag.name,
                        onTap: () => context
                            .read<CreateMomentCubit>()
                            .addTagFromSuggestion(tag),
                      ),
                    )
                    .toList(),
              ),
              const Gap(AppSpacing.md),
              Row(
                children: [
                  Icon(
                    Icons.eco_outlined,
                    size: 20,
                    color: context.themeColors.secondary,
                  ),
                  const Gap(AppSpacing.sm),
                  Text(
                    'Tap a suggestion to add it.',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.themeColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SuggestionChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xxs,
        ),
        decoration: BoxDecoration(
          color: context.themeColors.tertiary.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '#',
              style: TextStyle(
                color: context.themeColors.secondary,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'JetBrainsMono',
              ),
            ),
            const Gap(AppSpacing.xxs),
            Text(
              label,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.themeColors.textSecondary,
              ),
            ),
          ],
        ),
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
        color: context.themeColors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: context.themeColors.borderSubtle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '#',
            style: TextStyle(
              color: context.themeColors.secondary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'JetBrainsMono',
            ),
          ),
          const Gap(AppSpacing.xxs),
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.themeColors.textSecondary,
            ),
          ),
          const Gap(AppSpacing.xxs),
          GestureDetector(
            onTap: onRemove,
            child: Icon(
              Icons.close,
              size: 12,
              color: context.themeColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

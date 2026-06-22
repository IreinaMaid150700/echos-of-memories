part of '../search_screen.dart';

class _SearchAppBar extends StatelessWidget {
  const _SearchAppBar({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Semantics(
            button: true,
            label: 'Quay lại',
            child: GestureDetector(
              onTap: () => context.router.pop(),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.only(right: AppSpacing.xs),
                child: SvgPicture.asset(
                  Assets.icons.icBack,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: colors.borderSubtle),
              ),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.icSearch,
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                      colors.secondary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const Gap(AppSpacing.xs),
                  Expanded(
                    child: BlocSelector<SearchCubit, SearchState, String>(
                      selector: (state) => state.query,
                      builder: (context, query) {
                        return TextField(
                          controller: controller,
                          autofocus: true,
                          onChanged: context.read<SearchCubit>().onQueryChanged,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: colors.textPrimary,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: 'Tìm khoảnh khắc, nơi chốn, cảm xúc…',
                            hintStyle: context.textTheme.bodyMedium?.copyWith(
                              color: colors.secondary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  BlocSelector<SearchCubit, SearchState, bool>(
                    selector: (state) => state.query.isNotEmpty,
                    builder: (context, hasQuery) {
                      if (!hasQuery) return const SizedBox.shrink();
                      return Semantics(
                        button: true,
                        label: 'Xoá tìm kiếm',
                        child: GestureDetector(
                          onTap: () {
                            controller.clear();
                            context.read<SearchCubit>().clearQuery();
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Icon(
                            Icons.close,
                            size: 18,
                            color: colors.textMuted,
                          ),
                        ),
                      );
                    },
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

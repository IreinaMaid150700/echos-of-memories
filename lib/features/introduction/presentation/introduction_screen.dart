import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:music_app/core/constrant/app_contrants.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/introduction/domain/models/Introduction_content_model.dart';

@RoutePage()
class SaveYourMemIntroductionScreen extends StatefulWidget {
  const SaveYourMemIntroductionScreen({super.key});

  @override
  State<SaveYourMemIntroductionScreen> createState() =>
      _SaveYourMemIntroductionScreenState();
}

class _SaveYourMemIntroductionScreenState
    extends State<SaveYourMemIntroductionScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
  }

  void _onNext() {
    if (_currentPage < AppContrants.appLinks.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      context.router.push(const HomeRoute());
    }
  }

  void _onSkip() {
    context.router.push(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _SkipButton(onSkip: _onSkip),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: AppContrants.appLinks.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  return _IntroductionPage(content: AppContrants.appLinks[index]);
                },
              ),
            ),
            _PageIndicator(
              currentPage: _currentPage,
              totalPages: AppContrants.appLinks.length,
            ),
            const SizedBox(height: AppSpacing.lg),
            _NavigationButtons(
              currentPage: _currentPage,
              totalPages: AppContrants.appLinks.length,
              onNext: _onNext,
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton({required this.onSkip});

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSpacing.md,
          right: AppSpacing.xl,
        ),
        child: TextButton(
          onPressed: onSkip,
          child: Text(
            'Bỏ qua',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.themeColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _IntroductionPage extends StatelessWidget {
  const _IntroductionPage({required this.content});

  final IntroductionContentModel content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            content.title ?? '',
            style: context.textTheme.headlineMedium?.copyWith(
              color: context.themeColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xxl),
          ...content.description.map(
            (desc) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Text(
                desc,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.themeColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.currentPage,
    required this.totalPages,
  });

  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
          width: index == currentPage ? AppSpacing.md : AppSpacing.xs,
          height: AppSpacing.xs,
          decoration: BoxDecoration(
            color: index == currentPage
                ? context.themeColors.primary
                : context.themeColors.borderSubtle,
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
        ),
      ),
    );
  }
}

class _NavigationButtons extends StatelessWidget {
  const _NavigationButtons({
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
  });

  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;

  bool get _isLastPage => currentPage == totalPages - 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: AppSpacing.xxl),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: context.themeColors.primary,
                borderRadius: BorderRadius.circular(AppRadius.lg),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onNext,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                    child: Text(
                      _isLastPage ? 'Bắt đầu' : 'Tiếp theo',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.themeColors.surfaceLowest,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.xxl),
        ],
      ),
    );
  }
}
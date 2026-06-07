import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:music_app/core/constrant/app_contrants.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/introduction/domain/models/Introduction_content_model.dart';

part 'widgets/background_blob.dart';
part 'widgets/skip_button.dart';
part 'widgets/bottom_control.dart';

// Per-page background tints (light mode only, imperceptibly warm-shifted)
const _kLightBg = [
  Color(0xFFF9F6F1),
  Color(0xFFF4F7F3),
  Color(0xFFF8F4EE),
  Color(0xFFF7F3F4),
];

// Accent per page — drawn from the existing warm palette
const _kAccent = [
  Color(0xFFD67D61), // terracotta   — "ordinary days"
  Color(0xFF8A9A84), // sage          — "keep to yourself"
  Color(0xFFC9A87A), // warm sand     — "a small corner"
  Color(0xFFB87D7D), // dusty rose    — "look back someday"
];

const _kIcons = <IconData>[
  Icons.wb_sunny_outlined,
  Icons.lock_outline,
  Icons.spa_outlined,
  Icons.history_outlined,
];

// ---------------------------------------------------------------------------

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

  void _onPageChanged(int index) => setState(() => _currentPage = index);

  void _onNext() {
    final total = AppContrants.appLinks.length;
    if (_currentPage < total - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    } else {
      context.router.push(const HomeRoute());
    }
  }

  void _onSkip() => context.router.push(const HomeRoute());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final total = AppContrants.appLinks.length;
    final page = _currentPage.clamp(0, _kAccent.length - 1);
    final accent = _kAccent[page];
    final bgColor = isDark ? context.themeColors.background : _kLightBg[page];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        color: bgColor,
        child: Stack(
          children: [
            _BackgroundBlobs(pageIndex: _currentPage, accent: accent),
            SafeArea(
              child: Column(
                children: [
                  _SkipButton(
                    onSkip: _onSkip,
                    visible: _currentPage < total - 1,
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: total,
                      onPageChanged: _onPageChanged,
                      itemBuilder: (_, index) => _IntroductionPage(
                        content: AppContrants.appLinks[index],
                        pageIndex: index,
                        isActive: index == _currentPage,
                      ),
                    ),
                  ),
                  _BottomControls(
                    currentPage: _currentPage,
                    totalPages: total,
                    accent: accent,
                    onNext: _onNext,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroductionPage extends StatefulWidget {
  const _IntroductionPage({
    required this.content,
    required this.pageIndex,
    required this.isActive,
  });

  final IntroductionContentModel content;
  final int pageIndex;
  final bool isActive;

  @override
  State<_IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<_IntroductionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late final List<Animation<double>> _anims;

  // [illustration, title, desc0, desc1, desc2] - stagger intervals
  static const List<double> _starts = [0.0, 0.15, 0.30, 0.42, 0.52];
  static const List<double> _ends = [0.5, 0.60, 0.70, 0.80, 0.88];

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 960),
    );
    _anims = List.generate(
      5,
      (i) => CurvedAnimation(
        parent: _ctrl,
        curve: Interval(_starts[i], _ends[i], curve: Curves.easeOutCubic),
      ),
    );
    if (widget.isActive) _start();
  }

  void _start() {
    _ctrl.reset();
    Future.delayed(const Duration(milliseconds: 60), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void didUpdateWidget(_IntroductionPage old) {
    super.didUpdateWidget(old);
    if (widget.isActive && !old.isActive) _start();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Widget _animEntry({
    required Widget child,
    required Animation<double> anim,
    double slideY = 22,
  }) {
    return FadeTransition(
      opacity: anim,
      child: AnimatedBuilder(
        animation: anim,
        builder: (_, cached) => Transform.translate(
          offset: Offset(0, slideY * (1 - anim.value)),
          child: cached,
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final page = widget.pageIndex.clamp(0, _kAccent.length - 1);
    final accent = _kAccent[page];
    final icon = _kIcons[page];
    final descs = widget.content.description;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _animEntry(
            anim: _anims[0],
            slideY: 32,
            child: _PageIllustration(icon: icon, accent: accent),
          ),
          const SizedBox(height: AppSpacing.xxl),
          _animEntry(
            anim: _anims[1],
            slideY: 24,
            child: Text(
              widget.content.title ?? '',
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.themeColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontFamily: AppFonts.heading,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          ...List.generate(descs.length.clamp(0, 3), (i) {
            final text = descs[i];
            final isQuote = text.startsWith('“') || text.startsWith('"');
            return _animEntry(
              anim: _anims[(i + 2).clamp(0, 4)],
              slideY: 16,
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Text(
                  text,
                  style: isQuote
                      ? context.textTheme.bodyLarge?.copyWith(
                          color: accent,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          height: 1.65,
                        )
                      : context.textTheme.bodyMedium?.copyWith(
                          color: context.themeColors.textSecondary,
                          height: 1.65,
                        ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _PageIllustration extends StatelessWidget {
  const _PageIllustration({required this.icon, required this.accent});

  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 152,
            height: 152,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: accent.withValues(alpha: 0.18),
                width: 1,
              ),
            ),
          ),
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accent.withValues(alpha: 0.08),
              border: Border.all(
                color: accent.withValues(alpha: 0.16),
                width: 1,
              ),
            ),
          ),
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accent.withValues(alpha: 0.18),
            ),
            child: Icon(icon, size: 30, color: accent),
          ),
        ],
      ),
    );
  }
}



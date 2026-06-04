import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:music_app/core/constrant/app_contrants.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/introduction/domain/models/Introduction_content_model.dart';

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

// ---------------------------------------------------------------------------
// Background ambient blobs
// ---------------------------------------------------------------------------

class _BackgroundBlobs extends StatelessWidget {
  const _BackgroundBlobs({required this.pageIndex, required this.accent});

  final int pageIndex;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 650),
          child: SizedBox.expand(
            key: ValueKey(pageIndex),
            child: Stack(
              children: [
                Positioned(
                  right: -70,
                  top: -50,
                  child: _Blob(size: 250, color: accent, opacity: 0.07),
                ),
                Positioned(
                  left: -90,
                  bottom: 90,
                  child: _Blob(size: 290, color: accent, opacity: 0.05),
                ),
                Positioned(
                  right: 20,
                  bottom: 200,
                  child: _Blob(size: 100, color: accent, opacity: 0.04),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({required this.size, required this.color, required this.opacity});

  final double size;
  final Color color;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: opacity),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Skip button (fades out on last page)
// ---------------------------------------------------------------------------

class _SkipButton extends StatelessWidget {
  const _SkipButton({required this.onSkip, required this.visible});

  final VoidCallback onSkip;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.md,
            right: AppSpacing.xl,
          ),
          child: GestureDetector(
            onTap: visible ? onSkip : null,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xs),
              child: Text(
                'Bỏ qua',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.themeColors.textSecondary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Per-page content with stagger animation
// ---------------------------------------------------------------------------

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

// ---------------------------------------------------------------------------
// Page illustration - concentric rings + icon
// ---------------------------------------------------------------------------

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

// ---------------------------------------------------------------------------
// Bottom controls: indicator + CTA
// ---------------------------------------------------------------------------

class _BottomControls extends StatelessWidget {
  const _BottomControls({
    required this.currentPage,
    required this.totalPages,
    required this.accent,
    required this.onNext,
  });

  final int currentPage;
  final int totalPages;
  final Color accent;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalPages, (i) {
              final active = i == currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOutCubic,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: active ? 26 : 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.full),
                  color: active ? accent : context.themeColors.borderSubtle,
                  boxShadow: active
                      ? [
                          BoxShadow(
                            color: accent.withValues(alpha: 0.38),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
              );
            }),
          ),
          const SizedBox(height: AppSpacing.xl),
          _CtaButton(
            label: currentPage == totalPages - 1 ? 'Bắt đầu' : 'Tiếp theo',
            accent: accent,
            onTap: onNext,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// CTA button - accent fill, press scale, label crossfade
// ---------------------------------------------------------------------------

class _CtaButton extends StatefulWidget {
  const _CtaButton({
    required this.label,
    required this.accent,
    required this.onTap,
  });

  final String label;
  final Color accent;
  final VoidCallback onTap;

  @override
  State<_CtaButton> createState() => _CtaButtonState();
}

class _CtaButtonState extends State<_CtaButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _press;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _press = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 90),
      reverseDuration: const Duration(milliseconds: 200),
    );
    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(parent: _press, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _press.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _press.forward(),
      onTapUp: (_) {
        _press.reverse();
        widget.onTap();
      },
      onTapCancel: () => _press.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (_, child) =>
            Transform.scale(scale: _scaleAnim.value, child: child),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: 54,
          decoration: BoxDecoration(
            color: widget.accent,
            borderRadius: BorderRadius.circular(AppRadius.full),
            boxShadow: [
              BoxShadow(
                color: widget.accent.withValues(alpha: 0.28),
                blurRadius: 22,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 240),
              transitionBuilder: (child, anim) => FadeTransition(
                opacity: anim,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.25),
                    end: Offset.zero,
                  ).animate(anim),
                  child: child,
                ),
              ),
              child: Text(
                widget.label,
                key: ValueKey(widget.label),
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

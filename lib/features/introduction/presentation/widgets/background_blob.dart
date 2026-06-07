part of '../introduction_screen.dart';

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

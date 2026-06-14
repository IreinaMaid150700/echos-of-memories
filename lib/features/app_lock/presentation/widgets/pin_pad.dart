import 'package:flutter/material.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';

/// Numeric keypad (0-9 + backspace, optional biometric key).
class PinPad extends StatelessWidget {
  final ValueChanged<String> onDigit;
  final VoidCallback onBackspace;
  final VoidCallback? onBiometric;
  final bool enabled;

  const PinPad({
    super.key,
    required this.onDigit,
    required this.onBackspace,
    this.onBiometric,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final row in const [
          ['1', '2', '3'],
          ['4', '5', '6'],
          ['7', '8', '9'],
        ])
          _buildRow(context, row),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _leadingKey(context),
            _digitKey(context, '0'),
            _backspaceKey(context),
          ],
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, List<String> digits) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: digits.map((d) => _digitKey(context, d)).toList(),
    );
  }

  Widget _leadingKey(BuildContext context) {
    if (onBiometric == null) return const SizedBox(width: 72, height: 72);
    return _KeyButton(
      onTap: enabled ? onBiometric : null,
      child: Icon(Icons.fingerprint, color: context.themeColors.primary),
    );
  }

  Widget _digitKey(BuildContext context, String digit) {
    return _KeyButton(
      onTap: enabled ? () => onDigit(digit) : null,
      child: Text(
        digit,
        style: context.textTheme.headlineSmall?.copyWith(
          color: context.themeColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _backspaceKey(BuildContext context) {
    return _KeyButton(
      onTap: enabled ? onBackspace : null,
      child: Icon(
        Icons.backspace_outlined,
        color: context.themeColors.textSecondary,
      ),
    );
  }
}

class _KeyButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _KeyButton({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xs),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 72,
            height: 72,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}

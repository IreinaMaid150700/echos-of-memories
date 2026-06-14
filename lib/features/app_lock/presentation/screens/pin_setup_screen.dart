import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/app_lock/presentation/cubit/pin_cubit.dart';
import 'package:music_app/features/app_lock/presentation/widgets/pin_dots.dart';
import 'package:music_app/features/app_lock/presentation/widgets/pin_pad.dart';

/// First-time PIN setup: enter -> confirm -> show recovery code.
/// Pops with `true` once a PIN has been set and the recovery code acknowledged.
@RoutePage()
class PinSetupScreen extends StatelessWidget {
  const PinSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PinCubit>()..startSetup(),
      child: const _SetupView(),
    );
  }
}

class _SetupView extends StatelessWidget {
  const _SetupView();

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(title: const Text('Thiết lập PIN')),
      body: SafeArea(
        child: BlocConsumer<PinCubit, PinState>(
          listenWhen: (p, c) => p.error != c.error && c.error != null,
          listener: (context, state) => HapticFeedback.heavyImpact(),
          builder: (context, state) {
            if (state.stage == PinStage.done) {
              return _RecoveryCodeView(code: state.recoveryCode);
            }
            return _EntryView(state: state);
          },
        ),
      ),
    );
  }
}

class _EntryView extends StatelessWidget {
  final PinState state;
  const _EntryView({required this.state});

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    final cubit = context.read<PinCubit>();
    final isConfirm = state.stage == PinStage.confirm;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        children: [
          const Spacer(),
          Text(
            isConfirm ? 'Xác nhận mã PIN' : 'Tạo mã PIN 6 số',
            style: context.textTheme.titleLarge?.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(AppSpacing.xl),
          PinDots(filled: state.input.length, error: state.error != null),
          const Gap(AppSpacing.md),
          SizedBox(
            height: 20,
            child: Text(
              state.error ?? '',
              style: context.textTheme.bodySmall?.copyWith(
                color: colors.dangerText,
              ),
            ),
          ),
          const Spacer(),
          PinPad(
            enabled: !state.busy,
            onDigit: cubit.addDigit,
            onBackspace: cubit.backspace,
          ),
          const Gap(AppSpacing.xl),
        ],
      ),
    );
  }
}

class _RecoveryCodeView extends StatefulWidget {
  final String? code;
  const _RecoveryCodeView({this.code});

  @override
  State<_RecoveryCodeView> createState() => _RecoveryCodeViewState();
}

class _RecoveryCodeViewState extends State<_RecoveryCodeView> {
  bool _saved = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    // No recovery code (e.g. re-setup) — nothing to acknowledge, just finish.
    if (widget.code == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.router.maybePop(true);
      });
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(AppSpacing.xl),
          Icon(Icons.key_outlined, size: 48, color: colors.primary),
          const Gap(AppSpacing.lg),
          Text(
            'Mã khôi phục của bạn',
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(AppSpacing.sm),
          Text(
            'Lưu mã này ở nơi an toàn. Đây là cách duy nhất để khôi phục nếu bạn quên PIN. Mã chỉ hiển thị một lần.',
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall?.copyWith(
              color: colors.textMuted,
            ),
          ),
          const Gap(AppSpacing.xl),
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: colors.borderSubtle),
            ),
            child: SelectableText(
              widget.code!,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
          ),
          const Gap(AppSpacing.md),
          TextButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: widget.code!));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đã sao chép mã')),
              );
            },
            icon: const Icon(Icons.copy, size: 18),
            label: const Text('Sao chép'),
          ),
          const Spacer(),
          CheckboxListTile(
            value: _saved,
            onChanged: (v) => setState(() => _saved = v ?? false),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Tôi đã lưu mã khôi phục',
              style: context.textTheme.bodyMedium?.copyWith(
                color: colors.textPrimary,
              ),
            ),
          ),
          const Gap(AppSpacing.sm),
          FilledButton(
            onPressed: _saved ? () => context.router.maybePop(true) : null,
            child: const Text('Hoàn tất'),
          ),
        ],
      ),
    );
  }
}

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

/// Forgot-PIN recovery: enter recovery code -> set a new PIN.
@RoutePage()
class RecoveryScreen extends StatelessWidget {
  const RecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PinCubit>()..startRecovery(),
      child: const _RecoveryView(),
    );
  }
}

class _RecoveryView extends StatelessWidget {
  const _RecoveryView();

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(title: const Text('Khôi phục PIN')),
      body: SafeArea(
        child: BlocConsumer<PinCubit, PinState>(
          listenWhen: (p, c) =>
              (p.error != c.error && c.error != null) || p.stage != c.stage,
          listener: (context, state) {
            if (state.error != null) HapticFeedback.heavyImpact();
            if (state.stage == PinStage.done) context.router.maybePop(true);
          },
          builder: (context, state) {
            // verify stage = entering the recovery code; otherwise new PIN.
            if (state.stage == PinStage.verify) {
              return _CodeEntry(state: state);
            }
            return _NewPinEntry(state: state);
          },
        ),
      ),
    );
  }
}

class _CodeEntry extends StatefulWidget {
  final PinState state;
  const _CodeEntry({required this.state});

  @override
  State<_CodeEntry> createState() => _CodeEntryState();
}

class _CodeEntryState extends State<_CodeEntry> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    final cubit = context.read<PinCubit>();
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(AppSpacing.xl),
          Text(
            'Nhập mã khôi phục',
            style: context.textTheme.titleLarge?.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(AppSpacing.sm),
          Text(
            'Nhập mã khôi phục bạn đã lưu khi thiết lập PIN.',
            style: context.textTheme.bodySmall?.copyWith(
              color: colors.textMuted,
            ),
          ),
          const Gap(AppSpacing.xl),
          TextField(
            controller: _controller,
            autocorrect: false,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
              hintText: 'XXXX-XXXX-XXXX-XXXX',
              errorText: widget.state.error,
              border: const OutlineInputBorder(),
            ),
            // Mirror into cubit input so submit reads the latest value.
            onChanged: cubit.setRecoveryInput,
          ),
          const Gap(AppSpacing.lg),
          FilledButton(
            onPressed: widget.state.busy
                ? null
                : () => cubit.submitRecoveryCode(),
            child: const Text('Tiếp tục'),
          ),
        ],
      ),
    );
  }
}

class _NewPinEntry extends StatelessWidget {
  final PinState state;
  const _NewPinEntry({required this.state});

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
            isConfirm ? 'Xác nhận PIN mới' : 'Tạo PIN mới',
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

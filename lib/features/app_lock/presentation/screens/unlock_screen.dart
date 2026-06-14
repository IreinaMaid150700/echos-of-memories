import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/app_lock/presentation/cubit/pin_cubit.dart';
import 'package:music_app/features/app_lock/presentation/widgets/pin_dots.dart';
import 'package:music_app/features/app_lock/presentation/widgets/pin_pad.dart';

/// Screen shown when a guarded route is hit while locked.
/// Pops with `true` once unlocked so the guard can resolve navigation.
@RoutePage()
class UnlockScreen extends StatelessWidget {
  const UnlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PinCubit>()..startUnlock(),
      child: const _UnlockView(),
    );
  }
}

class _UnlockView extends StatefulWidget {
  const _UnlockView();

  @override
  State<_UnlockView> createState() => _UnlockViewState();
}

class _UnlockViewState extends State<_UnlockView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final cubit = context.read<PinCubit>();
      final ok = await cubit.tryBiometric();
      if (ok && mounted) context.router.maybePop(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: BlocConsumer<PinCubit, PinState>(
          listenWhen: (p, c) =>
              p.stage != c.stage || p.error != c.error,
          listener: (context, state) {
            if (state.stage == PinStage.done) {
              context.router.maybePop(true);
            }
            if (state.error != null) HapticFeedback.heavyImpact();
          },
          builder: (context, state) {
            final cubit = context.read<PinCubit>();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              child: Column(
                children: [
                  const Spacer(),
                  Icon(Icons.lock_outline, size: 48, color: colors.primary),
                  const Gap(AppSpacing.lg),
                  Text(
                    'Nhập mã PIN',
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
                      state.isLockedOut
                          ? 'Thử lại sau ${state.lockoutRemaining.inSeconds}s'
                          : (state.error ?? ''),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: colors.dangerText,
                      ),
                    ),
                  ),
                  const Spacer(),
                  PinPad(
                    enabled: !state.busy && !state.isLockedOut,
                    onDigit: cubit.addDigit,
                    onBackspace: cubit.backspace,
                    onBiometric: () async {
                      final ok = await cubit.tryBiometric();
                      if (ok && context.mounted) {
                        context.router.maybePop(true);
                      }
                    },
                  ),
                  const Gap(AppSpacing.md),
                  TextButton(
                    onPressed: () async {
                      await context.router.push(const RecoveryRoute());
                    },
                    child: const Text('Quên PIN?'),
                  ),
                  const Gap(AppSpacing.md),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

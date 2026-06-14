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

/// Change PIN: verify current PIN -> enter new -> confirm new.
@RoutePage()
class ChangePinScreen extends StatelessWidget {
  const ChangePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PinCubit>()..startChange(),
      child: const _ChangeView(),
    );
  }
}

class _ChangeView extends StatelessWidget {
  const _ChangeView();

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(title: const Text('Đổi mã PIN')),
      body: SafeArea(
        child: BlocConsumer<PinCubit, PinState>(
          listenWhen: (p, c) =>
              (p.error != c.error && c.error != null) ||
              p.stage != c.stage,
          listener: (context, state) {
            if (state.error != null) HapticFeedback.heavyImpact();
            if (state.stage == PinStage.done) context.router.maybePop(true);
          },
          builder: (context, state) {
            final cubit = context.read<PinCubit>();
            final title = switch (state.stage) {
              PinStage.verify => 'Nhập PIN hiện tại',
              PinStage.confirm => 'Xác nhận PIN mới',
              _ => 'Nhập PIN mới',
            };
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    title,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(AppSpacing.xl),
                  PinDots(
                    filled: state.input.length,
                    error: state.error != null,
                  ),
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
          },
        ),
      ),
    );
  }
}

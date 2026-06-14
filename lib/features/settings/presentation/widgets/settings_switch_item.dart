part of '../screens/settings_screen.dart';

class _SettingsSwitchItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final SettingsKey settingsKey;

  const _SettingsSwitchItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.settingsKey,
  });

  bool _getValue(SettingsState state) {
    switch (settingsKey) {
      case SettingsKey.appLock:
        return state.appLockEnabled;
      case SettingsKey.keepMemoriesOffline:
        return state.keepMemoriesOffline;
      case SettingsKey.gentleReminders:
        return state.gentleReminders;
    }
  }

  void _onChanged(BuildContext context, bool value) {
    final cubit = context.read<SettingsCubit>();
    switch (settingsKey) {
      case SettingsKey.appLock:
        _onAppLockChanged(context, cubit, value);
        break;
      case SettingsKey.keepMemoriesOffline:
        cubit.setKeepMemoriesOffline(value);
        break;
      case SettingsKey.gentleReminders:
        cubit.setGentleReminders(value);
        break;
    }
  }

  /// Turning ON with no PIN -> set up PIN first, only persist if completed.
  /// Turning OFF -> require an unlock (PIN verify) before disabling.
  Future<void> _onAppLockChanged(
    BuildContext context,
    SettingsCubit cubit,
    bool value,
  ) async {
    final router = context.router;
    if (value) {
      final hasPin = await cubit.hasPin();
      if (hasPin) {
        cubit.setAppLockEnabled(true);
        return;
      }
      final done = await router.push<bool>(const PinSetupRoute());
      if (done == true) cubit.setAppLockEnabled(true);
    } else {
      final unlocked = await router.push<bool>(const UnlockRoute());
      if (unlocked == true) cubit.setAppLockEnabled(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (prev, curr) => _getValue(prev) != _getValue(curr),
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm + AppSpacing.xxs,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: context.themeColors.tertiary,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: context.themeColors.textPrimary,
                ),
              ),
              const SizedBox(width: AppSpacing.sm + AppSpacing.xxs),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: context.textTheme.bodyMedium),
                    Text(
                      subtitle,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.themeColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: _getValue(state),
                onChanged: (value) => _onChanged(context, value),
                activeColor: context.themeColors.primary,
              ),
            ],
          ),
        );
      },
    );
  }
}

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
        cubit.setAppLockEnabled(value);
        break;
      case SettingsKey.keepMemoriesOffline:
        cubit.setKeepMemoriesOffline(value);
        break;
      case SettingsKey.gentleReminders:
        cubit.setGentleReminders(value);
        break;
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

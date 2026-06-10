import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/storage/preferences_service.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:music_app/features/settings/presentation/cubit/settings_state.dart';

part '../widgets/settings_switch_item.dart';
part '../widgets/settings_navigation_item.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          SettingsCubit(preferencesService: getIt<PreferencesService>())
            ..initialize(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Settings'),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              _SettingsSection(
                title: 'Privacy',
                items: [
                  _SettingsSwitchItem(
                    icon: Icons.lock_outline,
                    title: 'App lock',
                    subtitle: 'Require PIN to open app',
                    settingsKey: SettingsKey.appLock,
                  ),
                  _SettingsSwitchItem(
                    icon: Icons.cloud_off_outlined,
                    title: 'Keep memories offline',
                    subtitle: 'Disable cloud sync',
                    settingsKey: SettingsKey.keepMemoriesOffline,
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.lg),
              _SettingsSection(
                title: 'Appearance',
                items: [
                  _SettingsNavigationItem(
                    icon: Icons.palette_outlined,
                    title: 'Theme',
                    subtitle: 'System',
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.lg),
              _SettingsSection(
                title: 'Memory',
                items: [
                  _SettingsSwitchItem(
                    icon: Icons.notifications_outlined,
                    title: 'Gentle reminders',
                    subtitle: 'Daily memory prompts',
                    settingsKey: SettingsKey.gentleReminders,
                  ),
                  _SettingsNavigationItem(
                    icon: Icons.download_outlined,
                    title: 'Export memories',
                    subtitle: 'Download your data',
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.lg),
              _SettingsSection(
                title: 'About',
                items: [
                  _SettingsNavigationItem(
                    icon: Icons.help_outline,
                    title: 'Help & guide',
                  ),
                  _SettingsNavigationItem(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy promise',
                  ),
                ],
              ),
              if (kDebugMode) ...[
                const SizedBox(height: AppSpacing.lg),
                _SettingsSection(
                  title: 'Developer',
                  items: [
                    _SettingsNavigationItem(
                      icon: Icons.storage_outlined,
                      title: 'Database',
                      subtitle: 'View & manage local DB',
                      onTap: () =>
                          context.router.push(const DevDbViewerRoute()),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

enum SettingsKey { appLock, keepMemoriesOffline, gentleReminders }

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _SettingsSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Container(
          decoration: BoxDecoration(
            color: context.themeColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: context.themeColors.borderSubtle,
              width: 1,
            ),
          ),
          child: Column(
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              return Column(
                children: [
                  entry.value,
                  if (index < items.length - 1)
                    Divider(
                      height: 1,
                      indent: AppSpacing.xl + AppSpacing.md,
                      color: context.themeColors.borderSubtle,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

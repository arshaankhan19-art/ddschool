import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildSettingsGroup('Account', [
            _buildSettingsTile(Icons.person_outline, 'Edit Profile', () {}),
            _buildSettingsTile(Icons.lock_outline, 'Change Password', () {}),
          ]),
          const SizedBox(height: 24),
          _buildSettingsGroup('Notifications', [
            _buildSettingsTile(Icons.notifications_none, 'Push Notifications', null, trailing: Switch(value: true, onChanged: (v) {})),
            _buildSettingsTile(Icons.email_outlined, 'Email Notifications', null, trailing: Switch(value: false, onChanged: (v) {})),
          ]),
          const SizedBox(height: 24),
          _buildSettingsGroup('General', [
            _buildSettingsTile(Icons.language, 'Language', () {}, subtitle: 'English'),
            _buildSettingsTile(Icons.dark_mode_outlined, 'Dark Mode', null, trailing: Switch(value: false, onChanged: (v) {})),
          ]),
          const SizedBox(height: 24),
          _buildSettingsGroup('Support', [
            _buildSettingsTile(Icons.help_outline, 'Help Center', () {}),
            _buildSettingsTile(Icons.info_outline, 'About ddschool', () {}),
            _buildSettingsTile(Icons.privacy_tip_outline, 'Privacy Policy', () {}),
          ]),
        ],
      ),
    );
  }

  Widget _buildSettingsGroup(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
          ),
        ),
        Card(
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, VoidCallback? onTap, {String? subtitle, Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.accentColor),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing ?? (onTap != null ? const Icon(Icons.arrow_forward_ios, size: 14) : null),
      onTap: onTap,
    );
  }
}

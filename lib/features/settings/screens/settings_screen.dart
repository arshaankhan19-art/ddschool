import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/features/auth/screens/sign_in_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSettingsSection('ACCOUNT', [
              _buildSettingsTile(Icons.person_outline_rounded, 'Edit Profile'),
              _buildSettingsTile(Icons.lock_outline_rounded, 'Change Password'),
              _buildSettingsTile(Icons.phone_android_rounded, 'Mobile Number'),
              _buildSettingsTile(Icons.email_outlined, 'Email Address'),
            ]),
            const SizedBox(height: 24),
            _buildSettingsSection('SCHOOL', [
              _buildSettingsTile(Icons.school_outlined, 'School Information'),
              _buildSettingsTile(Icons.calendar_today_rounded, 'Academic Calendar'),
              _buildSettingsTile(Icons.contact_support_outlined, 'Contact School'),
              _buildSettingsTile(Icons.emergency_outlined, 'Emergency Contacts'),
            ]),
            const SizedBox(height: 24),
            _buildSettingsSection('SUPPORT', [
              _buildSettingsTile(Icons.help_outline_rounded, 'Help & Support'),
              _buildSettingsTile(Icons.report_problem_outlined, 'Report Issue'),
              _buildSettingsTile(Icons.question_answer_outlined, 'FAQ'),
            ]),
            const SizedBox(height: 24),
            _buildSettingsSection('ABOUT', [
              _buildSettingsTile(Icons.info_outline_rounded, 'About DD School'),
              _buildSettingsTile(Icons.privacy_tip_outlined, 'Privacy Policy'),
              _buildSettingsTile(Icons.description_outlined, 'Terms & Conditions'),
              _buildSettingsTile(Icons.verified_outlined, 'App Version', value: '1.0.0'),
            ]),
            const SizedBox(height: 32),
            _buildLogoutButton(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 12),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
              letterSpacing: 1,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFEEEEEE)),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, {String? value}) {
    return ListTile(
      onTap: () {},
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.primary, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value != null)
            Text(
              value,
              style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right_rounded, size: 20, color: AppColors.divider),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton.icon(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const SignInScreen()),
            (route) => false,
          );
        },
        icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
        label: const Text(
          'LOGOUT',
          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.redAccent, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}

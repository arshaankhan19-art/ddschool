import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/core/constants.dart';
import 'package:ddschool/features/settings/screens/settings_screen.dart';

import 'package:ddschool/features/profile/screens/parent_profile_screen.dart';
import 'package:ddschool/features/profile/screens/teacher_profile_screen.dart';
import 'package:ddschool/features/profile/screens/principal_profile_screen.dart';
import 'package:ddschool/features/profile/screens/admin_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final role = MockData.currentUserRole;
    
    if (role == UserRole.parent) {
      return const ParentProfileScreen();
    }
    if (role == UserRole.teacher) {
      return const TeacherProfileScreen();
    }
    if (role == UserRole.principal) {
      return const PrincipalProfileScreen();
    }
    if (role == UserRole.admin || role == UserRole.superAdmin) {
      return const AdminProfileScreen();
    }

    final String name = _getName(role);
    final String roleTitle = _getRoleTitle(role);
    final String id = _getId(role);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings_outlined, size: 24),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            _buildProfileHeader(name, roleTitle, id),
            const SizedBox(height: 32),
            _buildQuickActions(),
            const SizedBox(height: 32),
            _buildInfoSection('PERSONAL INFORMATION', [
              _buildInfoTile(Icons.phone_android_rounded, 'Mobile Number', _getPhone(role)),
              _buildInfoTile(Icons.email_outlined, 'Email Address', _getEmail(role)),
              _buildInfoTile(Icons.school_outlined, 'School Name', 'DD School'),
              _buildInfoTile(Icons.class_outlined, _getClassLabel(role), _getClassValue(role)),
            ]),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(String name, String roleTitle, String id) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                backgroundImage: const NetworkImage('https://api.dicebear.com/7.x/avataaars/svg?seed=Felix'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.camera_alt_rounded, size: 18, color: AppColors.textPrimary),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRoleBadge(roleTitle),
            const SizedBox(width: 8),
            Text(
              'ID: $id',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRoleBadge(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionItem(Icons.edit_outlined, 'Edit Profile'),
        _buildActionItem(Icons.badge_outlined, 'ID Card'),
        _buildActionItem(Icons.history_rounded, 'Activity'),
      ],
    );
  }

  Widget _buildActionItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFEEEEEE)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
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
          child: Column(children: tiles),
        ),
      ],
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return ListTile(
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
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
      ),
    );
  }

  // Helpers for Mock Data
  String _getName(UserRole role) {
    switch (role) {
      case UserRole.parent: return 'Rajesh Sharma';
      case UserRole.teacher: return 'Anjali Gupta';
      case UserRole.student: return 'Aryan Sharma';
      case UserRole.principal: return 'Dr. R.K. Verma';
      case UserRole.admin: return 'Suresh Kumar';
      default: return 'User';
    }
  }

  String _getRoleTitle(UserRole role) {
    return role.toString().split('.').last;
  }

  String _getId(UserRole role) {
    switch (role) {
      case UserRole.parent: return 'PAR-9021';
      case UserRole.teacher: return 'TCH-4412';
      case UserRole.student: return 'STU-2201';
      case UserRole.principal: return 'PRN-0001';
      case UserRole.admin: return 'ADM-1002';
      default: return 'ID-0000';
    }
  }

  String _getPhone(UserRole role) => '+91 98765 43210';
  String _getEmail(UserRole role) => 'user@ddschool.com';
  
  String _getClassLabel(UserRole role) {
    if (role == UserRole.teacher || role == UserRole.principal || role == UserRole.admin) {
      return 'Department';
    }
    return 'Class & Section';
  }

  String _getClassValue(UserRole role) {
    if (role == UserRole.teacher) return 'Mathematics';
    if (role == UserRole.principal) return 'Administration';
    if (role == UserRole.admin) return 'IT & Finance';
    return 'Class 8-A';
  }
}

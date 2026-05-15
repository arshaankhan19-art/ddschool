import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/dashboard_card.dart';
import '../../../core/widgets/stat_card.dart';

class SchoolAdminDashboard extends ConsumerWidget {
  const SchoolAdminDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'School Administration',
          style: TextStyle(color: AppTheme.accentColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: AppTheme.accentColor),
            onPressed: () => context.push('/notices'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Statistics',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Students',
                    value: '450',
                    icon: Icons.face_rounded,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Teachers',
                    value: '32',
                    icon: Icons.people_alt_rounded,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Attendance',
                    value: '94%',
                    icon: Icons.check_circle_outline_rounded,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Fees Collected',
                    value: '75%',
                    icon: Icons.account_balance_wallet_rounded,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Management Center',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                DashboardCard(
                  title: 'Student Mgmt',
                  subtitle: 'Records & Admission',
                  icon: Icons.person_add_alt_1_rounded,
                  iconColor: Colors.blueAccent,
                  onTap: () => context.push('/school-admin/students'),
                ),
                DashboardCard(
                  title: 'Teacher Mgmt',
                  subtitle: 'Faculty & Payroll',
                  icon: Icons.assignment_ind_rounded,
                  iconColor: Colors.teal,
                  onTap: () => context.push('/school-admin/teachers'),
                ),
                DashboardCard(
                  title: 'Fees Control',
                  subtitle: 'Structure & Dues',
                  icon: Icons.payments_rounded,
                  iconColor: Colors.green,
                  onTap: () => context.push('/school-admin/fees'),
                ),
                DashboardCard(
                  title: 'Classes',
                  subtitle: 'Sections & Subjects',
                  icon: Icons.class_rounded,
                  iconColor: Colors.deepOrange,
                  onTap: () => context.push('/school-admin/classes'),
                ),
                DashboardCard(
                  title: 'Notices',
                  subtitle: 'Broadcast Alerts',
                  icon: Icons.campaign_rounded,
                  iconColor: Colors.orange,
                  onTap: () => context.push('/notices'),
                ),
                DashboardCard(
                  title: 'Reports',
                  subtitle: 'Performance Logs',
                  icon: Icons.analytics_rounded,
                  iconColor: Colors.purple,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people_rounded), label: 'Users'),
          BottomNavigationBarItem(icon: Icon(Icons.payment_rounded), label: 'Finance'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 3) context.push('/profile');
        },
      ),
    );
  }
}

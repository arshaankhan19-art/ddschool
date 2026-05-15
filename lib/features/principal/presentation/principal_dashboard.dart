import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/dashboard_card.dart';
import '../../../core/widgets/stat_card.dart';

class PrincipalDashboard extends ConsumerWidget {
  const PrincipalDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Principal Portal',
          style: TextStyle(color: AppTheme.accentColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: AppTheme.accentColor),
            onPressed: () {},
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
              'School Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Teacher Attendance',
                    value: '28/32',
                    icon: Icons.assignment_ind_rounded,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Student Analytics',
                    value: 'Good',
                    icon: Icons.insights_rounded,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Academic Monitoring',
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
                  title: 'Staff Monitoring',
                  subtitle: 'Teachers & Staff',
                  icon: Icons.groups_rounded,
                  iconColor: Colors.brown,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Homework Logs',
                  subtitle: 'Daily Assignment Check',
                  icon: Icons.menu_book_rounded,
                  iconColor: Colors.orange,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Notices',
                  subtitle: 'View Announcements',
                  icon: Icons.campaign_rounded,
                  iconColor: Colors.redAccent,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Performance',
                  subtitle: 'School Insights',
                  icon: Icons.bar_chart_rounded,
                  iconColor: Colors.indigo,
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
          BottomNavigationBarItem(icon: Icon(Icons.assignment_rounded), label: 'Academics'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

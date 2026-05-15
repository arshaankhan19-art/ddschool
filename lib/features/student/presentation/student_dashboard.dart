import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/dashboard_card.dart';
import '../../../core/widgets/stat_card.dart';

class StudentDashboard extends ConsumerWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Student Portal',
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
              'My Learning',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Attendance',
                    value: '92%',
                    icon: Icons.calendar_today_rounded,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Homework',
                    value: '3 Pending',
                    icon: Icons.assignment_rounded,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Quick Access',
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
                  title: 'Homework',
                  subtitle: 'Daily Tasks',
                  icon: Icons.book_rounded,
                  iconColor: Colors.orange,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Timetable',
                  subtitle: 'My Schedule',
                  icon: Icons.schedule_rounded,
                  iconColor: Colors.blue,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Results',
                  subtitle: 'Exam Reports',
                  icon: Icons.grade_rounded,
                  iconColor: Colors.green,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Notices',
                  subtitle: 'School Alerts',
                  icon: Icons.campaign_rounded,
                  iconColor: Colors.redAccent,
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
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_rounded), label: 'Homework'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

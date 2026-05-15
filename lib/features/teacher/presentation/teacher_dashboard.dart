import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/dashboard_card.dart';
import '../../../core/widgets/stat_card.dart';

class TeacherDashboard extends ConsumerWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Teacher Dashboard',
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
              'My Classes Today',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Total Students',
                    value: '120',
                    icon: Icons.groups_rounded,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Upcoming Tests',
                    value: '2',
                    icon: Icons.assignment_late_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Teacher Utilities',
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
                  title: 'Attendance',
                  subtitle: 'Mark Student Presence',
                  icon: Icons.how_to_reg_rounded,
                  iconColor: Colors.green,
                  onTap: () => context.push('/teacher/attendance'),
                ),
                DashboardCard(
                  title: 'Homework',
                  subtitle: 'Assign & Review',
                  icon: Icons.note_add_rounded,
                  iconColor: Colors.orange,
                  onTap: () => context.push('/teacher/homework'),
                ),
                DashboardCard(
                  title: 'Timetable',
                  subtitle: 'My Weekly Schedule',
                  icon: Icons.calendar_view_week_rounded,
                  iconColor: Colors.blue,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Notices',
                  subtitle: 'School Updates',
                  icon: Icons.campaign_rounded,
                  iconColor: Colors.redAccent,
                  onTap: () => context.push('/notices'),
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
          BottomNavigationBarItem(icon: Icon(Icons.book_rounded), label: 'My Classes'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 2) context.push('/profile');
        },
      ),
    );
  }
}

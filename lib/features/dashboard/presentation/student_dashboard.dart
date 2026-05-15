import 'package:flutter/material.dart';
import '../../../core/widgets/base_dashboard.dart';
import '../../../core/widgets/dashboard_card.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDashboard(
      title: 'Student Portal',
      children: [
        DashboardCard(
          title: 'My Schedule',
          subtitle: 'Today\'s classes',
          icon: Icons.schedule_rounded,
          iconColor: Colors.indigo,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Assignments',
          subtitle: 'Pending tasks',
          icon: Icons.assignment_turned_in_rounded,
          iconColor: Colors.deepPurple,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Reports',
          subtitle: 'Grade sheets',
          icon: Icons.bar_chart_rounded,
          iconColor: Colors.blue,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Library',
          subtitle: 'E-books & Resources',
          icon: Icons.local_library_rounded,
          iconColor: Colors.brown,
          onTap: () {},
        ),
      ],
    );
  }
}

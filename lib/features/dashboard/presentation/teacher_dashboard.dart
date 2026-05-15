import 'package:flutter/material.dart';
import '../../../core/widgets/base_dashboard.dart';
import '../../../core/widgets/dashboard_card.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDashboard(
      title: 'Teacher Panel',
      children: [
        DashboardCard(
          title: 'My Classes',
          subtitle: 'Daily timetable',
          icon: Icons.calendar_today_rounded,
          iconColor: Colors.blue,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Attendance',
          subtitle: 'Mark daily records',
          icon: Icons.how_to_reg_rounded,
          iconColor: Colors.green,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Homework',
          subtitle: 'Assignments',
          icon: Icons.assignment_rounded,
          iconColor: Colors.orange,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Exam Marks',
          subtitle: 'Grading system',
          icon: Icons.grade_rounded,
          iconColor: Colors.redAccent,
          onTap: () {},
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/widgets/base_dashboard.dart';
import '../../../core/widgets/dashboard_card.dart';

class SchoolAdminDashboard extends StatelessWidget {
  const SchoolAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDashboard(
      title: 'School Admin',
      children: [
        DashboardCard(
          title: 'Teachers',
          subtitle: 'Manage faculty',
          icon: Icons.people_alt_rounded,
          iconColor: Colors.teal,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Students',
          subtitle: 'Student records',
          icon: Icons.face_rounded,
          iconColor: Colors.blueAccent,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Classes',
          subtitle: 'Sections & Timetable',
          icon: Icons.class_rounded,
          iconColor: Colors.deepOrange,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Fees',
          subtitle: 'Collection & Dues',
          icon: Icons.payments_rounded,
          iconColor: Colors.green,
          onTap: () {},
        ),
      ],
    );
  }
}

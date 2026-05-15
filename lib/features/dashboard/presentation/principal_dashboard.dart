import 'package:flutter/material.dart';
import '../../../core/widgets/base_dashboard.dart';
import '../../../core/widgets/dashboard_card.dart';

class PrincipalDashboard extends StatelessWidget {
  const PrincipalDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDashboard(
      title: 'Principal',
      children: [
        DashboardCard(
          title: 'Staff',
          subtitle: 'Teachers & Support',
          icon: Icons.assignment_ind_rounded,
          iconColor: Colors.brown,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Academics',
          subtitle: 'Syllabus & Exams',
          icon: Icons.menu_book_rounded,
          iconColor: Colors.blue,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Notices',
          subtitle: 'Announcements',
          icon: Icons.campaign_rounded,
          iconColor: Colors.orange,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Events',
          subtitle: 'School Calendar',
          icon: Icons.event_rounded,
          iconColor: Colors.redAccent,
          onTap: () {},
        ),
      ],
    );
  }
}

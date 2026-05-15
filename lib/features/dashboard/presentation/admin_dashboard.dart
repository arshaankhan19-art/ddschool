import 'package:flutter/material.dart';
import '../../../core/widgets/base_dashboard.dart';
import '../../../core/widgets/dashboard_card.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDashboard(
      title: 'Admin Panel',
      children: [
        DashboardCard(
          title: 'Schools',
          subtitle: 'Manage all schools',
          icon: Icons.business_rounded,
          iconColor: Colors.blue,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Admins',
          subtitle: 'School administrators',
          icon: Icons.admin_panel_settings_rounded,
          iconColor: Colors.orange,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Subscriptions',
          subtitle: 'Billing & Plans',
          icon: Icons.subscriptions_rounded,
          iconColor: Colors.purple,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Global Reports',
          subtitle: 'System analytics',
          icon: Icons.analytics_rounded,
          iconColor: Colors.green,
          onTap: () {},
        ),
      ],
    );
  }
}

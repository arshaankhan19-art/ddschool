import 'package:flutter/material.dart';
import '../../../core/widgets/base_dashboard.dart';
import '../../../core/widgets/dashboard_card.dart';

class ParentDashboard extends StatelessWidget {
  const ParentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDashboard(
      title: 'Parent Portal',
      children: [
        DashboardCard(
          title: 'My Children',
          subtitle: 'Progress tracking',
          icon: Icons.child_care_rounded,
          iconColor: Colors.pink,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Attendance',
          subtitle: 'History & Stats',
          icon: Icons.playlist_add_check_rounded,
          iconColor: Colors.green,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Fees Payment',
          subtitle: 'Online receipts',
          icon: Icons.account_balance_wallet_rounded,
          iconColor: Colors.blue,
          onTap: () {},
        ),
        DashboardCard(
          title: 'Teacher Chat',
          subtitle: 'Direct messages',
          icon: Icons.chat_bubble_outline_rounded,
          iconColor: Colors.orange,
          onTap: () {},
        ),
      ],
    );
  }
}

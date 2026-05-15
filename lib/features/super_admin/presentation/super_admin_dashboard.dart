import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/base_dashboard.dart';
import '../../../core/widgets/dashboard_card.dart';
import '../../../core/widgets/stat_card.dart';

class SuperAdminDashboard extends ConsumerWidget {
  const SuperAdminDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Super Admin',
          style: TextStyle(color: AppTheme.accentColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: AppTheme.accentColor),
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
              'Network Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Total Schools',
                    value: '24',
                    icon: Icons.school_rounded,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Active Revenue',
                    value: '\$12.5k',
                    icon: Icons.payments_rounded,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Total Students',
                    value: '12,450',
                    icon: Icons.people_rounded,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Subscriptions',
                    value: '18/24',
                    icon: Icons.verified_user_rounded,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Management',
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
                  title: 'Schools List',
                  subtitle: 'View & Manage',
                  icon: Icons.list_alt_rounded,
                  iconColor: Colors.blue,
                  onTap: () => context.push('/super-admin/schools'),
                ),
                DashboardCard(
                  title: 'Add School',
                  subtitle: 'Onboard new school',
                  icon: Icons.add_business_rounded,
                  iconColor: Colors.green,
                  onTap: () => context.push('/super-admin/add-school'),
                ),
                DashboardCard(
                  title: 'Analytics',
                  subtitle: 'Revenue & Growth',
                  icon: Icons.insights_rounded,
                  iconColor: Colors.purple,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Subscription',
                  subtitle: 'Plans & Billing',
                  icon: Icons.card_membership_rounded,
                  iconColor: Colors.orange,
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
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.business_rounded), label: 'Schools'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_rounded), label: 'Settings'),
        ],
      ),
    );
  }
}

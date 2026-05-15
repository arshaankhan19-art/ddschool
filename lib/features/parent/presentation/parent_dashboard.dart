import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/dashboard_card.dart';
import '../../../core/widgets/stat_card.dart';

class ParentDashboard extends ConsumerWidget {
  const ParentDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Parent Portal',
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
              'My Children',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 16),
            // Example of a child summary card
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: AppTheme.secondaryColor.withOpacity(0.3)),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const CircleAvatar(
                  backgroundColor: AppTheme.surfaceColor,
                  child: Icon(Icons.person, color: AppTheme.primaryColor),
                ),
                title: const Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Class 10-A | Roll No: 24'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Quick Actions',
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
                  subtitle: 'Daily Presence',
                  icon: Icons.calendar_month_rounded,
                  iconColor: Colors.green,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Fees',
                  subtitle: 'Payments & Dues',
                  icon: Icons.account_balance_wallet_rounded,
                  iconColor: Colors.blue,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Homework',
                  subtitle: 'Child\'s Tasks',
                  icon: Icons.assignment_rounded,
                  iconColor: Colors.orange,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Chat',
                  subtitle: 'Message Teachers',
                  icon: Icons.chat_rounded,
                  iconColor: Colors.purple,
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
          BottomNavigationBarItem(icon: Icon(Icons.child_care_rounded), label: 'Children'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

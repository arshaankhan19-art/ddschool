import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';

class PrincipalHomeScreen extends StatelessWidget {
  const PrincipalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildOverviewStats(),
              const SizedBox(height: 24),
              _buildSectionTitle('Attendance Analytics'),
              const SizedBox(height: 12),
              _buildAttendanceAnalytics(),
              const SizedBox(height: 24),
              _buildSectionTitle('Recent Activity'),
              const SizedBox(height: 12),
              _buildRecentActivity(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome,', style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
            Text('Dr. Verma', style: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.divider,
          child: Icon(Icons.admin_panel_settings, color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildOverviewStats() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildStatCard('Total Students', '1,240', Icons.people, Colors.blue),
        _buildStatCard('Total Teachers', '84', Icons.school, Colors.orange),
        _buildStatCard('Avg Attendance', '94%', Icons.show_chart, Colors.green),
        _buildStatCard('Pending Fees', '₹4.2L', Icons.account_balance_wallet, Colors.red),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary));
  }

  Widget _buildAttendanceAnalytics() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Daily Presence', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.more_horiz),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBar(40, 'Mon'),
              _buildBar(60, 'Tue'),
              _buildBar(80, 'Wed'),
              _buildBar(70, 'Thu'),
              _buildBar(90, 'Fri'),
              _buildBar(30, 'Sat'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double height, String label) {
    return Column(
      children: [
        Container(
          width: 30,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
      ],
    );
  }

  Widget _buildRecentActivity() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divider),
          ),
          child: Row(
            children: [
              const CircleAvatar(backgroundColor: AppColors.divider, child: Icon(Icons.notifications_active, size: 18, color: AppColors.primary)),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Notice Published', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text('Regarding Mid-term results declaration', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  ],
                ),
              ),
              Text('2h ago', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/core/constants.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

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
              _buildChildCard(),
              const SizedBox(height: 24),
              _buildQuickOverview(),
              const SizedBox(height: 24),
              _buildSectionTitle('Quick Actions'),
              const SizedBox(height: 12),
              _buildQuickActions(),
              const SizedBox(height: 24),
              _buildSectionTitle("Today's Homework"),
              const SizedBox(height: 12),
              _buildHomeworkPreview(),
              const SizedBox(height: 24),
              _buildSectionTitle("School Updates"),
              const SizedBox(height: 12),
              _buildNoticePreview(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Namaste,', style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
            Text('Mr. Sharma', style: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
        const CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.divider,
          child: Icon(Icons.person, color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildChildCard() {
    final child = MockData.studentProfile;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(child['photoUrl']),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(child['name'], style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text('${child['class']} - ${child['section']}', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14)),
                Text('Roll No: ${child['rollNo']}', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12)),
            child: const Text('Active', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickOverview() {
    return Row(
      children: [
        _buildOverviewItem('Attendance', MockData.studentProfile['attendance'], Icons.calendar_today_outlined, Colors.blue),
        const SizedBox(width: 12),
        _buildOverviewItem('Fee Due', MockData.studentProfile['feeDue'], Icons.account_balance_wallet_outlined, Colors.red),
      ],
    );
  }

  Widget _buildOverviewItem(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        TextButton(onPressed: () {}, child: const Text('View All', style: TextStyle(color: AppColors.primary))),
      ],
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.payment, 'label': 'Pay Fees'},
      {'icon': Icons.receipt_long, 'label': 'Receipts'},
      {'icon': Icons.exit_to_app, 'label': 'Apply Leave'},
      {'icon': Icons.contact_support_outlined, 'label': 'Contact'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actions.map((action) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.divider)),
            child: Icon(action['icon'] as IconData, color: AppColors.primary),
          ),
          const SizedBox(height: 8),
          Text(action['label'] as String, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
        ],
      )).toList(),
    );
  }

  Widget _buildHomeworkPreview() {
    final homework = MockData.homework[0];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.divider)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(homework['subject'], style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
              Text(homework['date'], style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 8),
          Text(homework['description'], maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildNoticePreview() {
    final notice = MockData.notices[0];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.divider)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle),
            child: const Icon(Icons.campaign, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notice['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(notice['content'], maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

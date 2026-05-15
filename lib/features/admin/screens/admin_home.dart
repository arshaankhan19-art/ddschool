import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Console'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuickStats(),
            const SizedBox(height: 24),
            const Text('Management', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildManagementGrid(),
            const SizedBox(height: 24),
            const Text('System Analytics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildAnalyticsCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats() {
    return Row(
      children: [
        _buildStatBox('Students', '1,240', Colors.blue),
        const SizedBox(width: 12),
        _buildStatBox('Teachers', '84', Colors.orange),
        const SizedBox(width: 12),
        _buildStatBox('Revenue', '₹12L', Colors.green),
      ],
    );
  }

  Widget _buildStatBox(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18)),
            Text(label, style: TextStyle(color: color.withOpacity(0.8), fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _buildManagementGrid() {
    final items = [
      {'title': 'Students', 'icon': Icons.people, 'color': Colors.blue},
      {'title': 'Teachers', 'icon': Icons.school, 'color': Colors.orange},
      {'title': 'Parents', 'icon': Icons.family_restroom, 'color': Colors.purple},
      {'title': 'Fees', 'icon': Icons.payments, 'color': Colors.green},
      {'title': 'Notices', 'icon': Icons.campaign, 'color': Colors.red},
      {'title': 'Gallery', 'icon': Icons.photo_library, 'color': Colors.teal},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: Icon(item['icon'] as IconData, color: item['color'] as Color),
            ),
            const SizedBox(height: 8),
            Text(item['title'] as String, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        );
      },
    );
  }

  Widget _buildAnalyticsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('School Growth', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) => Container(
              width: 30,
              height: 40 + (index * 10),
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(4)),
            )),
          ),
          const SizedBox(height: 16),
          const Text('Admission rate increased by 12% this month', style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }
}

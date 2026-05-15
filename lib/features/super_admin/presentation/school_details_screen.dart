import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/school.dart';
import '../../../core/widgets/stat_card.dart';

class SchoolDetailsScreen extends StatelessWidget {
  final School school;
  const SchoolDetailsScreen({super.key, required this.school});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(school.name),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildDetailRow(Icons.location_on_outlined, 'Address', school.address ?? 'Not set'),
                    const Divider(height: 32),
                    _buildDetailRow(Icons.phone_outlined, 'Phone', school.phone ?? 'Not set'),
                    const Divider(height: 32),
                    _buildDetailRow(Icons.email_outlined, 'Email', school.email ?? 'Not set'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'School Statistics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Total Students',
                    value: '1,200',
                    icon: Icons.people_rounded,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Active Teachers',
                    value: '85',
                    icon: Icons.school_rounded,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Subscription History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Premium Plan - ${2024 - index}'),
                    subtitle: const Text('Paid on 12 Jan'),
                    trailing: const Text('\$4,500', style: TextStyle(fontWeight: FontWeight.bold)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppTheme.primaryColor, size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.accentColor)),
          ],
        ),
      ],
    );
  }
}

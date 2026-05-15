import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/stat_card.dart';

class RevenueScreen extends StatelessWidget {
  const RevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Revenue Overview', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Monthly Revenue',
                    value: '\$12,500',
                    icon: Icons.trending_up_rounded,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Total Revenue',
                    value: '\$145,000',
                    icon: Icons.account_balance_rounded,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Revenue by School',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text('Oakridge School ${index + 1}'),
                    subtitle: const Text('Premium Plan'),
                    trailing: const Text(
                      '\$450/mo',
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

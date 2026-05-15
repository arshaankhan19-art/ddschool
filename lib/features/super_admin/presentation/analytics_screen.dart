import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/stat_card.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Global Analytics', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Growth Metrics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'New Schools (MoM)',
                    value: '+15%',
                    icon: Icons.trending_up,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'User Retention',
                    value: '98.2%',
                    icon: Icons.person_pin_circle_outlined,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'System Performance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildMetricRow('Server Uptime', '99.99%', Colors.green),
                    const Divider(),
                    _buildMetricRow('Avg. Response Time', '120ms', Colors.blue),
                    const Divider(),
                    _buildMetricRow('Daily Active Users', '45,200', Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Placeholder for a chart
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.secondaryColor.withOpacity(0.3)),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bar_chart_rounded, size: 48, color: AppTheme.primaryColor),
                    SizedBox(height: 8),
                    Text('Growth Chart Visualization', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

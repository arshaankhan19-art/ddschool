import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';

class PrincipalReportsScreen extends StatelessWidget {
  const PrincipalReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('School Reports')),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.9,
        children: [
          _buildReportCard('Academic Performance', Icons.auto_graph, Colors.blue),
          _buildReportCard('Fee Collection', Icons.payments_outlined, Colors.green),
          _buildReportCard('Teacher Performance', Icons.person_search, Colors.orange),
          _buildReportCard('Attendance Trends', Icons.trending_up, Colors.purple),
          _buildReportCard('Inventory Status', Icons.inventory_2_outlined, Colors.brown),
          _buildReportCard('Exam Results', Icons.description_outlined, Colors.red),
        ],
      ),
    );
  }

  Widget _buildReportCard(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Text('View Details', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';

class PrincipalReportsScreen extends StatelessWidget {
  const PrincipalReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Reports'),
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
        children: [
          _buildReportCard('Academic Performance', Icons.auto_graph_rounded, Colors.blue),
          _buildReportCard('Fee Collection', Icons.payments_rounded, Colors.green),
          _buildReportCard('Teacher Performance', Icons.person_search_rounded, AppColors.primary),
          _buildReportCard('Attendance Trends', Icons.trending_up_rounded, Colors.purple),
          _buildReportCard('Inventory Status', Icons.inventory_2_rounded, Colors.brown),
          _buildReportCard('Exam Results', Icons.description_rounded, Colors.redAccent),
        ],
      ),
    );
  }

  Widget _buildReportCard(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary, height: 1.2),
          ),
          const SizedBox(height: 12),
          const Text('View Details', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

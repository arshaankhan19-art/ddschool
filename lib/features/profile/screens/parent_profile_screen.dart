import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/features/settings/screens/settings_screen.dart';
import 'package:ddschool/features/parent/screens/parent_child_screen.dart';

class ParentProfileScreen extends StatelessWidget {
  const ParentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Parent Profile'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings_outlined, color: AppColors.textPrimary, size: 26),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // HEADER
            _buildHeader(),
            const SizedBox(height: 30),

            // SECTION 1 — PERSONAL DETAILS
            _buildSectionTitle('PERSONAL DETAILS'),
            const SizedBox(height: 12),
            _buildPersonalDetailsCard(),
            const SizedBox(height: 32),

            // SECTION 2 — CHILDREN
            _buildSectionTitle('LINKED CHILDREN'),
            const SizedBox(height: 12),
            _buildChildrenSection(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.accent, width: 2),
          ),
          child: const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://api.dicebear.com/7.x/avataaars/svg?seed=Rajesh'),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Mr. Rajesh Sharma',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Parent / Guardian',
          style: TextStyle(
            fontSize: 15,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondary,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalDetailsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          _buildDetailRow('Full Name', 'Mr. Rajesh Sharma'),
          _buildDetailRow('Mobile Number', '+91 98765 43210'),
          _buildDetailRow('Alternate Mobile', '+91 98765 43211'),
          _buildDetailRow('Email', 'rajesh.sharma@example.com'),
          _buildDetailRow('Address', 'H-42, Green Park Extension'),
          _buildDetailRow('City', 'New Delhi'),
          _buildDetailRow('State', 'Delhi'),
          _buildDetailRow('Pincode', '110016'),
          _buildDetailRow('Relationship', 'Father', isLast: true),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        border: isLast ? null : Border(bottom: BorderSide(color: AppColors.divider.withOpacity(0.3))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildChildrenSection(BuildContext context) {
    return Column(
      children: [
        _buildChildCard(
          context,
          name: 'Aryan Sharma',
          className: 'Class 10-A',
          rollNo: '21',
          attendance: '92%',
          performance: 'A Grade',
          imageUrl: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Aryan',
        ),
        const SizedBox(height: 16),
        _buildChildCard(
          context,
          name: 'Ananya Sharma',
          className: 'Class 6-B',
          rollNo: '08',
          attendance: '95%',
          performance: 'A+',
          imageUrl: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Ananya',
        ),
      ],
    );
  }

  Widget _buildChildCard(
    BuildContext context, {
    required String name,
    required String className,
    required String rollNo,
    required String attendance,
    required String performance,
    required String imageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(imageUrl),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                    ),
                    Text(
                      '$className • Roll No $rollNo',
                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildChildMiniStat(Icons.calendar_today_rounded, 'Attendance', attendance),
              const SizedBox(width: 32),
              _buildChildMiniStat(Icons.auto_graph_rounded, 'Performance', performance),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ParentChildScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary.withOpacity(0.08),
                foregroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text(
                'View Progress',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChildMiniStat(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.accent.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 14, color: AppColors.accent),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
            Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          ],
        ),
      ],
    );
  }
}

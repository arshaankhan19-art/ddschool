import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class ClassesManagementScreen extends StatelessWidget {
  const ClassesManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Classes & Sections', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add_home_work_rounded, color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 12,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                ),
              ),
              title: Text('Grade ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Wrap(
                    spacing: 8,
                    children: ['Section A', 'Section B', 'Section C'].map((section) {
                      return Chip(
                        label: Text(section),
                        backgroundColor: AppTheme.backgroundColor,
                        onDeleted: () {},
                      );
                    }).toList(),
                  ),
                ),
                ListTile(
                  title: const Text('Add Section', style: TextStyle(color: AppTheme.primaryColor, fontSize: 14)),
                  leading: const Icon(Icons.add, color: AppTheme.primaryColor, size: 20),
                  onTap: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

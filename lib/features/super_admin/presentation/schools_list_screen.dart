import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/school.dart';

class SchoolsListScreen extends ConsumerWidget {
  const SchoolsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This would typically come from a provider
    final List<School> schools = [
      School(id: '1', name: 'Oakridge International', subscriptionStatus: 'Active'),
      School(id: '2', name: 'Springfield Academy', subscriptionStatus: 'Pending'),
      School(id: '3', name: 'Greenwood High', subscriptionStatus: 'Expired'),
    ];

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('All Schools', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: schools.length,
        itemBuilder: (context, index) {
          final school = schools[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.school_rounded, color: AppTheme.primaryColor),
              ),
              title: Text(school.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Status: ${school.subscriptionStatus}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

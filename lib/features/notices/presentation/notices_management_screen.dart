import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/notice.dart';

class NoticesManagementScreen extends ConsumerWidget {
  const NoticesManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock data for notices
    final List<Notice> notices = [
      Notice(
        id: '1',
        schoolId: 's1',
        title: 'Annual Sports Day',
        content: 'The annual sports day will be held on 25th Oct.',
        targetRole: 'all',
        createdAt: DateTime.now(),
      ),
      Notice(
        id: '2',
        schoolId: 's1',
        title: 'Teacher Meeting',
        content: 'Emergency staff meeting at 3 PM today.',
        targetRole: 'teacher',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Notices Management', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('New Notice', style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: notices.length,
        itemBuilder: (context, index) {
          final notice = notices[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      notice.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      notice.targetRole?.toUpperCase() ?? 'ALL',
                      style: const TextStyle(color: AppTheme.primaryColor, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(notice.content),
                  const SizedBox(height: 8),
                  Text(
                    'Posted on: ${notice.createdAt.toString().split(' ')[0]}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(child: Text('Edit')),
                  const PopupMenuItem(child: Text('Delete', style: TextStyle(color: Colors.red))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

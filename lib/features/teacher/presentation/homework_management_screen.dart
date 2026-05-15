import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/homework.dart';

class HomeworkManagementScreen extends ConsumerWidget {
  const HomeworkManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock data
    final List<Homework> homeworkList = [
      Homework(
        id: '1',
        schoolId: 's1',
        classId: 'c1',
        sectionId: 'sec1',
        teacherId: 't1',
        title: 'Algebra Worksheet',
        description: 'Complete questions 1-10 on page 45.',
        dueDate: DateTime.now().add(const Duration(days: 2)),
        createdAt: DateTime.now(),
      ),
    ];

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Homework Management', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Assign Homework', style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: homeworkList.length,
        itemBuilder: (context, index) {
          final homework = homeworkList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(homework.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(
                        'Due: ${homework.dueDate.toString().split(' ')[0]}',
                        style: const TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(homework.description, style: const TextStyle(color: Colors.grey)),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Grade 10 - Section A', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      TextButton(onPressed: () {}, child: const Text('View Submissions')),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

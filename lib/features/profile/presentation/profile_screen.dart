import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/presentation/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserDataProvider).value;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: AppTheme.surfaceColor,
              child: Icon(Icons.person, size: 60, color: AppTheme.primaryColor),
            ),
            const SizedBox(height: 24),
            Text(
              user?.fullName ?? 'Loading...',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              user?.role.value.toUpperCase().replaceAll('_', ' ') ?? '',
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 40),
            _buildInfoCard(Icons.email_outlined, 'Email', user?.email ?? ''),
            _buildInfoCard(Icons.phone_outlined, 'Phone', user?.phone ?? 'Not provided'),
            _buildInfoCard(Icons.school_outlined, 'School ID', user?.schoolId ?? 'N/A'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => ref.read(authRepositoryProvider).signOut(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent.withOpacity(0.1),
                foregroundColor: Colors.redAccent,
                elevation: 0,
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String label, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primaryColor),
        title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.accentColor)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/snackbar_helper.dart';
import '../../../models/school.dart';
import '../../auth/domain/user_role.dart';

class CreateSchoolAdminScreen extends ConsumerStatefulWidget {
  const CreateSchoolAdminScreen({super.key});

  @override
  ConsumerState<CreateSchoolAdminScreen> createState() => _CreateSchoolAdminScreenState();
}

class _CreateSchoolAdminScreenState extends ConsumerState<CreateSchoolAdminScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _selectedSchoolId;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _create() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedSchoolId == null) {
      SnackbarHelper.showError(context, 'Please select a school');
      return;
    }

    setState(() => _isLoading = true);
    try {
      // Logic to create school admin user in Supabase
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        SnackbarHelper.showSuccess(context, 'School Admin created successfully');
        context.pop();
      }
    } catch (e) {
      if (mounted) SnackbarHelper.showError(context, e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Create School Admin'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Create a new administrator for a specific school.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              _buildSchoolDropdown(),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _nameController,
                label: 'Admin Full Name',
                prefixIcon: Icons.person_outline,
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                label: 'Admin Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                label: 'Temporary Password',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                validator: (v) => (v?.length ?? 0) < 6 ? 'Min 6 characters' : null,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Create Admin Account',
                isLoading: _isLoading,
                onPressed: _create,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSchoolDropdown() {
    // Mock schools
    final schools = [
      {'id': '1', 'name': 'Oakridge International'},
      {'id': '2', 'name': 'Springfield Academy'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select School', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.accentColor)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedSchoolId,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
          items: schools.map((s) => DropdownMenuItem(value: s['id'], child: Text(s['name']!))).toList(),
          onChanged: (v) => setState(() => _selectedSchoolId = v),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/snackbar_helper.dart';

class AddEditStudentScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? student;
  const AddEditStudentScreen({super.key, this.student});

  @override
  ConsumerState<AddEditStudentScreen> createState() => _AddEditStudentScreenState();
}

class _AddEditStudentScreenState extends ConsumerState<AddEditStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _rollController;
  String? _selectedClass = 'Grade 10';
  String? _selectedSection = 'Section A';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student?['users']?['full_name']);
    _emailController = TextEditingController(text: widget.student?['users']?['email']);
    _rollController = TextEditingController(text: widget.student?['roll_number']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _rollController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      // Logic to save student
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        SnackbarHelper.showSuccess(context, 'Student record updated');
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
        title: Text(widget.student == null ? 'Add Student' : 'Edit Student'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _nameController,
                label: 'Full Name',
                prefixIcon: Icons.person_outline,
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                label: 'Email Address',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _rollController,
                label: 'Roll Number',
                prefixIcon: Icons.numbers_outlined,
              ),
              const SizedBox(height: 16),
              _buildDropdown('Class', _selectedClass, ['Grade 10', 'Grade 11', 'Grade 12'], (v) => setState(() => _selectedClass = v)),
              const SizedBox(height: 16),
              _buildDropdown('Section', _selectedSection, ['Section A', 'Section B', 'Section C'], (v) => setState(() => _selectedSection = v)),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Save Student',
                isLoading: _isLoading,
                onPressed: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.accentColor)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

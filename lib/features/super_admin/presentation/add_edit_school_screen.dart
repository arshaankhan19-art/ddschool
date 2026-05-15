import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/snackbar_helper.dart';
import '../../../models/school.dart';

class AddEditSchoolScreen extends ConsumerStatefulWidget {
  final School? school;
  const AddEditSchoolScreen({super.key, this.school});

  @override
  ConsumerState<AddEditSchoolScreen> createState() => _AddEditSchoolScreenState();
}

class _AddEditSchoolScreenState extends ConsumerState<AddEditSchoolScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.school?.name);
    _addressController = TextEditingController(text: widget.school?.address);
    _phoneController = TextEditingController(text: widget.school?.phone);
    _emailController = TextEditingController(text: widget.school?.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      // Logic to save school to Supabase via service
      await Future.delayed(const Duration(seconds: 1)); // Mock delay
      if (mounted) {
        SnackbarHelper.showSuccess(context, 'School saved successfully');
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
        title: Text(widget.school == null ? 'Add School' : 'Edit School'),
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
                label: 'School Name',
                prefixIcon: Icons.business_rounded,
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _addressController,
                label: 'Address',
                prefixIcon: Icons.location_on_outlined,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _phoneController,
                label: 'Phone Number',
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Save School',
                isLoading: _isLoading,
                onPressed: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';

class AddHomeworkScreen extends StatefulWidget {
  const AddHomeworkScreen({super.key});

  @override
  State<AddHomeworkScreen> createState() => _AddHomeworkScreenState();
}

class _AddHomeworkScreenState extends State<AddHomeworkScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedClass;
  String? _selectedSection;
  String? _selectedSubject;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;

  final List<String> _classes = ['Class 6', 'Class 7', 'Class 8', 'Class 9', 'Class 10'];
  final List<String> _sections = ['A', 'B', 'C', 'D'];
  final List<String> _subjects = ['Mathematics', 'Science', 'English', 'History', 'Geography', 'Hindi'];

  String _formatDate(DateTime date, {bool includeYear = false}) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    String formatted = "${date.day} ${months[date.month - 1]}";
    if (includeYear) {
      formatted += ", ${date.year}";
    }
    return formatted;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Add Homework'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdownSection(),
              const SizedBox(height: 24),
              _buildTextField(
                label: 'Homework Title',
                hint: 'Enter title (e.g. Chapter 4 Quiz)',
                controller: _titleController,
                validator: (value) => value!.isEmpty ? 'Please enter title' : null,
              ),
              const SizedBox(height: 24),
              _buildTextField(
                label: 'Description',
                hint: 'Enter homework details...',
                controller: _descriptionController,
                maxLines: 4,
                validator: (value) => value!.isEmpty ? 'Please enter description' : null,
              ),
              const SizedBox(height: 24),
              _buildDatePicker(),
              const SizedBox(height: 32),
              _buildAttachButton(),
              const SizedBox(height: 40),
              _buildAssignButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownSection() {
    return Row(
      children: [
        Expanded(
          child: _buildDropdown(
            label: 'Class',
            value: _selectedClass,
            items: _classes,
            onChanged: (val) => setState(() => _selectedClass = val),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildDropdown(
            label: 'Section',
            value: _selectedSection,
            items: _sections,
            onChanged: (val) => setState(() => _selectedSection = val),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildDropdown(
            label: 'Subject',
            value: _selectedSubject,
            items: _subjects,
            onChanged: (val) => setState(() => _selectedSubject = val),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEEEEEE)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              hint: Text('Select', style: TextStyle(fontSize: 13, color: AppColors.textSecondary.withOpacity(0.5))),
              items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 13)))).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14, color: AppColors.textSecondary.withOpacity(0.5)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Due Date',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFEEEEEE)),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today_rounded, size: 20, color: AppColors.primary.withOpacity(0.7)),
                const SizedBox(width: 12),
                Text(
                  _selectedDate == null ? 'Select Due Date' : _formatDate(_selectedDate!, includeYear: true),
                  style: TextStyle(
                    fontSize: 14,
                    color: _selectedDate == null ? AppColors.textSecondary.withOpacity(0.5) : AppColors.textPrimary,
                    fontWeight: _selectedDate == null ? FontWeight.normal : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAttachButton() {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.attach_file_rounded, size: 20),
      label: const Text('Attach Photo / File'),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        side: const BorderSide(color: Color(0xFFEEEEEE)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  Widget _buildAssignButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: _assignHomework,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          elevation: 0,
        ),
        child: const Text('Assign Homework', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  void _assignHomework() {
    if (_formKey.currentState!.validate()) {
      if (_selectedClass == null || _selectedSection == null || _selectedSubject == null || _selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all fields')),
        );
        return;
      }

      final newHomework = {
        'subject': _selectedSubject!.toUpperCase(),
        'classSection': '${_selectedClass!.replaceAll('Class ', '')}$_selectedSection',
        'date': _formatDate(_selectedDate!),
        'title': _titleController.text,
        'submissions': '0/32',
      };

      Navigator.pop(context, newHomework);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Homework Assigned Successfully'),
          backgroundColor: AppColors.primary,
        ),
      );
    }
  }
}

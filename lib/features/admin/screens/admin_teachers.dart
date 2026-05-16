import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';

class AdminTeachersScreen extends StatefulWidget {
  const AdminTeachersScreen({super.key});

  @override
  State<AdminTeachersScreen> createState() => _AdminTeachersScreenState();
}

class _AdminTeachersScreenState extends State<AdminTeachersScreen> {
  final List<Map<String, dynamic>> _teachers = [
    {
      'name': 'Ms. Anjali Gupta',
      'id': 'TCH-4412',
      'subject': 'Mathematics',
      'designation': 'PGT',
      'class': '10-A',
      'status': 'Active',
      'avatar': 'https://api.dicebear.com/7.x/avataaars/svg?seed=Anjali',
      'attendance': '98%',
      'classesTaken': '142',
      'pendingHomework': '2',
      'rating': '4.8',
    },
    {
      'name': 'Mr. Rajesh Kumar',
      'id': 'TCH-8901',
      'subject': 'Physics',
      'designation': 'PGT',
      'class': '11-B',
      'status': 'Active',
      'avatar': 'https://api.dicebear.com/7.x/avataaars/svg?seed=Rajesh',
      'attendance': '95%',
      'classesTaken': '120',
      'pendingHomework': '0',
      'rating': '4.5',
    },
    {
      'name': 'Mrs. Sunita Sharma',
      'id': 'TCH-2234',
      'subject': 'English',
      'designation': 'TGT',
      'class': '8-C',
      'status': 'On Leave',
      'avatar': 'https://api.dicebear.com/7.x/avataaars/svg?seed=Sunita',
      'attendance': '88%',
      'classesTaken': '95',
      'pendingHomework': '5',
      'rating': '4.2',
    },
    {
      'name': 'Mr. Amit Verma',
      'id': 'TCH-5567',
      'subject': 'Chemistry',
      'designation': 'TGT',
      'class': '9-A',
      'status': 'Active',
      'avatar': 'https://api.dicebear.com/7.x/avataaars/svg?seed=Amit',
      'attendance': '92%',
      'classesTaken': '110',
      'pendingHomework': '1',
      'rating': '4.6',
    },
  ];

  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Active', 'On Leave', 'Class Teachers', 'Subject Teachers'];

  List<Map<String, dynamic>> get _filteredTeachers {
    if (_selectedFilter == 'All') return _teachers;
    if (_selectedFilter == 'Active') return _teachers.where((t) => t['status'] == 'Active').toList();
    if (_selectedFilter == 'On Leave') return _teachers.where((t) => t['status'] == 'On Leave').toList();
    if (_selectedFilter == 'Class Teachers') return _teachers.where((t) => t['class'] != null && t['class'] != 'None').toList();
    if (_selectedFilter == 'Subject Teachers') return _teachers.where((t) => t['subject'] != null).toList();
    return _teachers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Teachers Management'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildFilterChips(),
            const SizedBox(height: 24),
            _buildStatsSection(),
            const SizedBox(height: 32),
            _filteredTeachers.isEmpty 
              ? _buildEmptyState()
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _filteredTeachers.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) => _buildTeacherCard(_filteredTeachers[index]),
                ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showTeacherForm(context, isEdit: false),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: const Text('Add Teacher', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        const SizedBox(height: 40),
        Icon(Icons.person_off_rounded, size: 60, color: AppColors.textSecondary.withValues(alpha: 0.3)),
        const SizedBox(height: 16),
        Text(
          'No teachers found',
          style: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.5), fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search teacher by name, ID or subject',
          hintStyle: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.5), fontSize: 13),
          prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textSecondary),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final isSelected = _selectedFilter == filter;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilter = filter),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: isSelected ? AppColors.primary : const Color(0xFFEEEEEE)),
              ),
              child: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatsSection() {
    int total = _teachers.length;
    int active = _teachers.where((t) => t['status'] == 'Active').toList().length;
    int leave = _teachers.where((t) => t['status'] == 'On Leave').toList().length;

    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          _buildStatCard('Total Teachers', total.toString(), Icons.groups_rounded, Colors.blue),
          _buildStatCard('Present Today', active.toString(), Icons.how_to_reg_rounded, Colors.green),
          _buildStatCard('On Leave', leave.toString(), Icons.event_busy_rounded, Colors.orange),
          _buildStatCard('Pending Approvals', '5', Icons.assignment_late_rounded, Colors.redAccent),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const Spacer(),
              Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textPrimary),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherCard(Map<String, dynamic> teacher) {
    final bool isOnLeave = teacher['status'] == 'On Leave';

    return GestureDetector(
      onTap: () => _showTeacherDetails(context, teacher),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
          border: Border.all(color: const Color(0xFFEEEEEE)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(teacher['avatar']),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teacher['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${teacher['id']} • ${teacher['subject']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          teacher['designation'],
                          style: const TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Class Teacher: ${teacher['class']}',
                        style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => _showTeacherOptions(context, teacher),
                  icon: const Icon(Icons.more_vert_rounded, color: AppColors.textSecondary, size: 20),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isOnLeave ? Colors.orange.withValues(alpha: 0.1) : Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: isOnLeave ? Colors.orange : Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        teacher['status'],
                        style: TextStyle(
                          color: isOnLeave ? Colors.orange : Colors.green,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showTeacherOptions(BuildContext context, Map<String, dynamic> teacher) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: 20),
            _buildOptionTile(context, Icons.edit_outlined, 'Edit Teacher', onTap: () {
              Navigator.pop(context);
              _showTeacherForm(context, isEdit: true, teacher: teacher);
            }),
            _buildOptionTile(context, Icons.delete_outline_rounded, 'Remove Teacher', color: Colors.red, onTap: () {
              Navigator.pop(context);
              _confirmRemoveTeacher(context, teacher);
            }),
            _buildOptionTile(context, Icons.phone_in_talk_outlined, 'Contact Teacher'),
            _buildOptionTile(context, Icons.person_outline_rounded, 'View Profile', onTap: () {
              Navigator.pop(context);
              _showTeacherDetails(context, teacher);
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context, IconData icon, String title, {Color? color, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap ?? () => Navigator.pop(context),
      leading: Icon(icon, color: color ?? AppColors.textPrimary),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? AppColors.textPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }

  void _confirmRemoveTeacher(BuildContext context, Map<String, dynamic> teacher) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('Remove Teacher?', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text(
          'Are you sure you want to remove ${teacher['name']} from DD School?',
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _removeTeacher(teacher);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Remove Teacher'),
          ),
        ],
      ),
    );
  }

  void _removeTeacher(Map<String, dynamic> teacher) {
    final index = _teachers.indexOf(teacher);
    setState(() {
      _teachers.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Teacher removed successfully'),
        backgroundColor: AppColors.primary,
        action: SnackBarAction(
          label: 'UNDO',
          textColor: AppColors.accent,
          onPressed: () {
            setState(() {
              _teachers.insert(index, teacher);
            });
          },
        ),
      ),
    );
  }

  void _showTeacherDetails(BuildContext context, Map<String, dynamic> teacher) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _TeacherDetailsModal(teacher: teacher),
    );
  }

  void _showTeacherForm(BuildContext context, {required bool isEdit, Map<String, dynamic>? teacher}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _TeacherFormModal(isEdit: isEdit, teacher: teacher),
    );
  }
}

class _TeacherDetailsModal extends StatelessWidget {
  final Map<String, dynamic> teacher;
  const _TeacherDetailsModal({required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 32),
                  _buildInfoSection('PERSONAL DETAILS', [
                    _buildInfoRow(Icons.person_outline_rounded, 'Full Name', teacher['name']),
                    _buildInfoRow(Icons.fingerprint_rounded, 'Employee ID', teacher['id']),
                    _buildInfoRow(Icons.phone_android_rounded, 'Mobile Number', '+91 98765 43210'),
                    _buildInfoRow(Icons.email_outlined, 'Email', 'teacher@ddschool.com'),
                    _buildInfoRow(Icons.cake_outlined, 'DOB', '15 May 1985'),
                    _buildInfoRow(Icons.wc_rounded, 'Gender', 'Female'),
                    _buildInfoRow(Icons.opacity_rounded, 'Blood Group', 'B+ Positive'),
                    _buildInfoRow(Icons.location_on_outlined, 'Address', '123, Green Lane, New Delhi'),
                  ]),
                  const SizedBox(height: 24),
                  _buildInfoSection('PROFESSIONAL DETAILS', [
                    _buildInfoRow(Icons.menu_book_rounded, 'Subject(s)', teacher['subject']),
                    _buildInfoRow(Icons.work_outline_rounded, 'Designation', teacher['designation']),
                    _buildInfoRow(Icons.account_tree_outlined, 'Department', 'Science'),
                    _buildInfoRow(Icons.school_outlined, 'Qualification', 'M.Sc, B.Ed'),
                    _buildInfoRow(Icons.timeline_rounded, 'Experience', '10 Years'),
                    _buildInfoRow(Icons.calendar_today_rounded, 'Joining Date', '10 Aug 2018'),
                    _buildInfoRow(Icons.supervised_user_circle_outlined, 'Assigned Class', teacher['class']),
                  ]),
                  const SizedBox(height: 24),
                  _buildInfoSection('WORK DETAILS', [
                    _buildInfoRow(Icons.calendar_month_rounded, 'Attendance %', teacher['attendance']),
                    _buildInfoRow(Icons.play_circle_outline_rounded, 'Classes Taken', teacher['classesTaken']),
                    _buildInfoRow(Icons.assignment_late_outlined, 'Pending Homework', teacher['pendingHomework']),
                    _buildInfoRow(Icons.star_rounded, 'Performance Rating', teacher['rating']),
                  ]),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(teacher['avatar']),
        ),
        const SizedBox(height: 16),
        Text(
          teacher['name'],
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
        Text(
          '${teacher['designation']} • ${teacher['subject']}',
          style: const TextStyle(fontSize: 14, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
          child: Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textSecondary, letterSpacing: 1.2),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFEEEEEE)),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: AppColors.primary, size: 18),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
                Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TeacherFormModal extends StatelessWidget {
  final bool isEdit;
  final Map<String, dynamic>? teacher;
  const _TeacherFormModal({required this.isEdit, this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 24),
          Text(isEdit ? 'Edit Teacher' : 'Add New Teacher', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildTextField('Full Name', Icons.person_outline_rounded, initialValue: teacher?['name']),
                  const SizedBox(height: 16),
                  _buildTextField('Employee ID', Icons.fingerprint_rounded, initialValue: teacher?['id']),
                  const SizedBox(height: 16),
                  _buildTextField('Mobile Number', Icons.phone_android_rounded, initialValue: isEdit ? '+91 98765 43210' : null),
                  const SizedBox(height: 16),
                  _buildTextField('Email', Icons.email_outlined, initialValue: isEdit ? 'teacher@ddschool.com' : null),
                  const SizedBox(height: 16),
                  _buildTextField('Subject', Icons.menu_book_rounded, initialValue: teacher?['subject']),
                  const SizedBox(height: 16),
                  _buildTextField('Department', Icons.account_tree_outlined, initialValue: isEdit ? 'Science' : null),
                  const SizedBox(height: 16),
                  _buildDropdownField('Designation', ['PGT', 'TGT', 'PRT'], initialValue: teacher?['designation']),
                  const SizedBox(height: 16),
                  _buildTextField('Qualification', Icons.school_outlined, initialValue: isEdit ? 'M.Sc, B.Ed' : null),
                  const SizedBox(height: 16),
                  _buildTextField('Experience', Icons.timeline_rounded, initialValue: isEdit ? '10 Years' : null),
                  const SizedBox(height: 16),
                  _buildTextField('Assign Class', Icons.supervised_user_circle_outlined, initialValue: teacher?['class']),
                  if (isEdit) ...[
                    const SizedBox(height: 16),
                    _buildDropdownField('Status', ['Active', 'On Leave'], initialValue: teacher?['status']),
                  ],
                  const SizedBox(height: 24),
                  _buildUploadUI(),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: const Text('Cancel', style: TextStyle(color: AppColors.textPrimary)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: Text(isEdit ? 'Save Changes' : 'Save Teacher'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, {String? initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEEEEEE)),
          ),
          child: TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, size: 20, color: AppColors.textSecondary),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> items, {String? initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEEEEEE)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: items.contains(initialValue) ? initialValue : items.first,
              items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadUI() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        children: [
          Icon(Icons.cloud_upload_outlined, size: 40, color: AppColors.primary.withValues(alpha: 0.5)),
          const SizedBox(height: 12),
          const Text('Upload Teacher Photo', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const Text('PNG or JPG, Max 5MB', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}

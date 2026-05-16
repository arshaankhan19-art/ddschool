import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/features/settings/screens/settings_screen.dart';

class TeacherProfileScreen extends StatelessWidget {
  const TeacherProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Teacher Profile'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings_outlined, color: AppColors.textPrimary, size: 26),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildIdCardAction(context),
            const SizedBox(height: 32),
            _buildInfoSection('PERSONAL INFORMATION', [
              _buildInfoRow(Icons.person_outline_rounded, 'Full Name', 'Ms. Anjali Gupta'),
              _buildInfoRow(Icons.fingerprint_rounded, 'Employee ID', 'TCH-4412'),
              _buildInfoRow(Icons.phone_android_rounded, 'Mobile Number', '+91 98765 43210'),
              _buildInfoRow(Icons.email_outlined, 'Email Address', 'anjali.gupta@ddschool.com'),
              _buildInfoRow(Icons.wc_rounded, 'Gender', 'Female'),
              _buildInfoRow(Icons.cake_outlined, 'Date of Birth', '12 May 1988'),
              _buildInfoRow(Icons.opacity_rounded, 'Blood Group', 'O+ Positive'),
              _buildInfoRow(Icons.location_on_outlined, 'Address', 'B-12, Sector 4, Rohini, New Delhi'),
            ]),
            const SizedBox(height: 24),
            _buildInfoSection('PROFESSIONAL DETAILS', [
              _buildInfoRow(Icons.work_outline_rounded, 'Designation', 'PGT (Post Graduate Teacher)'),
              _buildInfoRow(Icons.account_tree_outlined, 'Department', 'Science & Mathematics'),
              _buildInfoRow(Icons.menu_book_rounded, 'Subject(s) Teaching', 'Mathematics, Physics'),
              _buildInfoRow(Icons.supervised_user_circle_outlined, 'Class Teacher Of', 'Class 10-A'),
              _buildInfoRow(Icons.school_outlined, 'Qualification', 'M.Sc Mathematics, B.Ed'),
              _buildInfoRow(Icons.timeline_rounded, 'Experience', '8 Years'),
              _buildInfoRow(Icons.calendar_today_rounded, 'Joining Date', '15 July 2016'),
              _buildInfoRow(Icons.assignment_ind_outlined, 'Employee Type', 'Permanent'),
            ]),
            const SizedBox(height: 24),
            _buildInfoSection('SCHOOL DETAILS', [
              _buildInfoRow(Icons.apartment_rounded, 'School Name', 'DD School'),
              _buildInfoRow(Icons.alt_route_rounded, 'Branch', 'Main Campus, New Delhi'),
              _buildInfoRow(Icons.person_pin_rounded, 'Reporting Principal', 'Dr. R.K. Verma'),
              _buildInfoRow(Icons.schedule_rounded, 'Working Hours', '08:00 AM - 02:30 PM'),
            ]),
            const SizedBox(height: 24),
            _buildInfoSection('EMERGENCY DETAILS', [
              _buildInfoRow(Icons.contact_phone_outlined, 'Emergency Name', 'Mr. Vikram Gupta'),
              _buildInfoRow(Icons.phone_in_talk_outlined, 'Emergency Contact', '+91 91234 56789'),
            ]),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.accent, width: 2),
          ),
          child: const CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage('https://api.dicebear.com/7.x/avataaars/svg?seed=Anjali'),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Ms. Anjali Gupta',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'PGT Mathematics • Department of Science',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Text(
            'TEACHER',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIdCardAction(BuildContext context) {
    return GestureDetector(
      onTap: () => _showIdCard(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
          border: Border.all(color: AppColors.primary.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.badge_outlined, color: AppColors.primary, size: 24),
            const SizedBox(width: 12),
            const Text(
              'View Staff ID Card',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showIdCard(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ID Card Header
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.school_rounded, color: Colors.white, size: 30),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'DD School',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Excellence in Education',
                            style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 2),
                            image: const DecorationImage(
                              image: NetworkImage('https://api.dicebear.com/7.x/avataaars/svg?seed=Anjali'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Anjali Gupta',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                              ),
                              const Text(
                                'PGT Mathematics',
                                style: TextStyle(fontSize: 13, color: AppColors.textSecondary, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 12),
                              _buildIdField('Employee ID', 'TCH-4412'),
                              _buildIdField('Department', 'Science'),
                              _buildIdField('Blood Group', 'O+'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Divider(color: AppColors.divider),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildIdField('Joining Date', '15/07/2016'),
                            _buildIdField('Phone', '+91 98765 43210'),
                            _buildIdField('Emergency', '+91 91234 56789'),
                          ],
                        ),
                        // Barcode placeholder
                        Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(Icons.qr_code_2_rounded, size: 30, color: Colors.grey[400]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(width: 80, height: 1, color: Colors.grey[400]),
                            const SizedBox(height: 4),
                            const Text('Teacher Sign', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            Container(width: 80, height: 1, color: Colors.grey[400]),
                            const SizedBox(height: 4),
                            const Text('Principal Sign', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
                  ),
                  child: const Center(
                    child: Text(
                      'Close',
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textSecondary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIdField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 11, color: AppColors.textPrimary),
          children: [
            TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
            TextSpan(text: value, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
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
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
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
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

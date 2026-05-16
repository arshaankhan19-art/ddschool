import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/features/settings/screens/settings_screen.dart';

class PrincipalProfileScreen extends StatelessWidget {
  const PrincipalProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Principal Profile'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
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
              _buildInfoRow(Icons.person_outline_rounded, 'Full Name', 'Dr. R.K. Verma'),
              _buildInfoRow(Icons.phone_android_rounded, 'Mobile Number', '+91 99999 88888'),
              _buildInfoRow(Icons.email_outlined, 'Email Address', 'principal@ddschool.com'),
              _buildInfoRow(Icons.wc_rounded, 'Gender', 'Male'),
              _buildInfoRow(Icons.cake_outlined, 'Date of Birth', '20 August 1970'),
              _buildInfoRow(Icons.opacity_rounded, 'Blood Group', 'B+ Positive'),
              _buildInfoRow(Icons.location_on_outlined, 'Address', 'A-45, Civil Lines, New Delhi'),
            ]),
            const SizedBox(height: 24),
            _buildInfoSection('PROFESSIONAL DETAILS', [
              _buildInfoRow(Icons.work_outline_rounded, 'Designation', 'Principal'),
              _buildInfoRow(Icons.school_outlined, 'Qualification', 'Ph.D. in Education, M.Sc. Physics'),
              _buildInfoRow(Icons.timeline_rounded, 'Experience', '25+ Years'),
              _buildInfoRow(Icons.calendar_today_rounded, 'Joining Date', '01 April 2010'),
              _buildInfoRow(Icons.star_outline_rounded, 'Leadership Exp.', '15 Years as Principal'),
              _buildInfoRow(Icons.assignment_ind_outlined, 'Employee Type', 'Permanent'),
              _buildInfoRow(Icons.schedule_rounded, 'Office Timing', '08:00 AM - 04:00 PM'),
            ]),
            const SizedBox(height: 24),
            _buildInfoSection('SCHOOL DETAILS', [
              _buildInfoRow(Icons.apartment_rounded, 'School Name', 'DD School'),
              _buildInfoRow(Icons.verified_user_outlined, 'Affiliation', 'CBSE - 1234567'),
              _buildInfoRow(Icons.alt_route_rounded, 'Branch Name', 'Main Campus, New Delhi'),
              _buildInfoRow(Icons.people_outline_rounded, 'Total Students', '2,450'),
              _buildInfoRow(Icons.groups_outlined, 'Total Teachers', '125'),
              _buildInfoRow(Icons.contact_mail_outlined, 'School Email', 'info@ddschool.com'),
            ]),
            const SizedBox(height: 24),
            _buildInfoSection('EMERGENCY CONTACT', [
              _buildInfoRow(Icons.contact_phone_outlined, 'Emergency Name', 'Mrs. Sunita Verma'),
              _buildInfoRow(Icons.phone_in_talk_outlined, 'Emergency Contact', '+91 98888 77777'),
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
            radius: 60,
            backgroundImage: NetworkImage('https://api.dicebear.com/7.x/avataaars/svg?seed=Principal'),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Dr. R.K. Verma',
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Text(
            'PRINCIPAL',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'PRN-0001 • DD School',
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Principal • DD School',
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary.withValues(alpha: 0.8),
            fontStyle: FontStyle.italic,
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
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.badge_outlined, color: AppColors.primary, size: 24),
              SizedBox(width: 12),
              Text(
                'View Principal ID Card',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
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
                    const Icon(Icons.school_rounded, color: Colors.white, size: 32),
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
                            'Leading with Vision',
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
                          width: 110,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.primary.withValues(alpha: 0.2), width: 2),
                            image: const DecorationImage(
                              image: NetworkImage('https://api.dicebear.com/7.x/avataaars/svg?seed=Principal'),
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
                                'Dr. R.K. Verma',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                              ),
                              const Text(
                                'Principal',
                                style: TextStyle(fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 12),
                              _buildIdField('Principal ID', 'PRN-0001'),
                              _buildIdField('Qualification', 'Ph.D., M.Sc.'),
                              _buildIdField('Blood Group', 'B+'),
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
                            _buildIdField('Joining Date', '01/04/2010'),
                            _buildIdField('Phone', '+91 99999 88888'),
                            _buildIdField('Email', 'principal@ddschool.com'),
                          ],
                        ),
                        // QR placeholder
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.qr_code_2_rounded, size: 50, color: Colors.grey[400]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'EMERGENCY: +91 98888 77777',
                          style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        Column(
                          children: [
                            Container(
                              width: 100,
                              height: 1,
                              color: Colors.grey[400],
                            ),
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
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
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
                color: Colors.black.withValues(alpha: 0.02),
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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

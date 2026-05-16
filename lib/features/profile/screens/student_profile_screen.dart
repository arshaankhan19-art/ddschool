import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/core/constants.dart';
import 'package:ddschool/features/settings/screens/settings_screen.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Student Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings_outlined, size: 24),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),
            _buildIDCardButton(context),
            const SizedBox(height: 32),
            _buildInfoSection('BASIC INFORMATION', [
              _buildDetailRow('Full Name', 'Aryan Sharma'),
              _buildDetailRow('Admission No', 'DD/2023/1042'),
              _buildDetailRow('Student ID', 'STU-2201'),
              _buildDetailRow('Roll Number', '24'),
              _buildDetailRow('Class & Section', '8 - A'),
              _buildDetailRow('House', 'Agni (Red)'),
              _buildDetailRow('Session', '2023-24'),
              _buildDetailRow('Date of Birth', '12 May 2010'),
              _buildDetailRow('Gender', 'Male'),
              _buildDetailRow('Blood Group', 'B+ Positive'),
              _buildDetailRow('Aadhaar No', 'XXXX-XXXX-8921'),
              _buildDetailRow('Religion', 'Hinduism'),
              _buildDetailRow('Category', 'General'),
            ]),
            const SizedBox(height: 24),
            _buildInfoSection('PARENT DETAILS', [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text('Father Details', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 13)),
              ),
              _buildDetailRow('Father Name', 'Mr. Rajesh Sharma'),
              _buildDetailRow('Occupation', 'Software Engineer'),
              _buildDetailRow('Mobile No', '+91 98765 43210'),
              const Divider(indent: 16, endIndent: 16, height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text('Mother Details', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 13)),
              ),
              _buildDetailRow('Mother Name', 'Mrs. Sunita Sharma'),
              _buildDetailRow('Occupation', 'Home Maker'),
              _buildDetailRow('Mobile No', '+91 98765 43211'),
            ]),
            const SizedBox(height: 24),
            _buildInfoSection('CONTACT DETAILS', [
              _buildDetailRow('Reg. Mobile', '+91 98765 43210'),
              _buildDetailRow('Email Address', 'aryan.sharma@example.com'),
              _buildDetailRow('Address', 'H-42, Green Park Extension, New Delhi - 110016'),
              _buildDetailRow('Emergency Contact', '+91 91234 56789'),
            ]),
            const SizedBox(height: 24),
            _buildInfoSection('SCHOOL DETAILS', [
              _buildDetailRow('School Name', 'DD School'),
              _buildDetailRow('Affiliation', 'CBSE'),
              _buildDetailRow('School Code', '60124'),
              _buildDetailRow('Academic Year', '2023-2024'),
              _buildDetailRow('Bus Route', 'Route No. 12 (Saket)'),
            ]),
            const SizedBox(height: 24),
            _buildInfoSection('ACADEMIC DETAILS', [
              _buildDetailRow('Current Class', '8th Grade'),
              _buildDetailRow('Section', 'A'),
              _buildDetailRow('Attendance %', '92% (Till date)'),
              _buildDetailRow('Class Teacher', 'Ms. Anjali Gupta'),
            ]),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: const CircleAvatar(
            radius: 55,
            backgroundColor: AppColors.background,
            backgroundImage: NetworkImage('https://api.dicebear.com/7.x/avataaars/svg?seed=Aryan'),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Aryan Sharma',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
              child: const Text('STUDENT', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 8),
            const Text('ID: STU-2201', style: TextStyle(fontSize: 14, color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }

  Widget _buildIDCardButton(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => _showIDCardModal(context),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(color: AppColors.primary.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.badge_outlined, color: AppColors.primary, size: 20),
              SizedBox(width: 10),
              Text('VIEW ID CARD', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 13, letterSpacing: 0.5)),
            ],
          ),
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
          child: Text(title, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary, letterSpacing: 1)),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFEEEEEE)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 15, offset: const Offset(0, 5)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(children: children),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            flex: 3,
            child: Text(value, textAlign: TextAlign.right, style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showIDCardModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return const IDCardModal();
      },
    );
  }
}

class IDCardModal extends StatefulWidget {
  const IDCardModal({super.key});

  @override
  State<IDCardModal> createState() => _IDCardModalState();
}

class _IDCardModalState extends State<IDCardModal> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85, // Sufficient height for the modal
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 20),
          const Text('Digital ID Card', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 4),
          Text(_currentPage == 0 ? 'Front Side' : 'Back Side', style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              children: [
                _buildResponsiveCard(_buildFrontSide()),
                _buildResponsiveCard(_buildBackSide()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8, height: 8,
                decoration: BoxDecoration(shape: BoxShape.circle, color: _currentPage == index ? AppColors.primary : Colors.grey.withOpacity(0.3)),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveCard(Widget card) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: FittedBox(
          fit: BoxFit.contain, // Changed from scaleDown to contain for better sizing
          child: card,
        ),
      ),
    );
  }

  Widget _buildFrontSide() {
    return Container(
      width: 300,
      height: 520, // Increased height to accommodate all content
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 30, offset: const Offset(0, 15))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Column(
          children: [
            Container(
              height: 90, // Slightly reduced header height
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.school_rounded, color: AppColors.accent, size: 28),
                    const SizedBox(height: 4),
                    const Text('DD SCHOOL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1)),
                    Text('AFFILIATED TO CBSE', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.primary.withOpacity(0.1), width: 3)),
              child: const CircleAvatar(radius: 45, backgroundColor: AppColors.background, backgroundImage: NetworkImage('https://api.dicebear.com/7.x/avataaars/svg?seed=Aryan')),
            ),
            const SizedBox(height: 12),
            const Text('ARYAN SHARMA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            const Text('Class: 8 - Section: A', style: TextStyle(fontSize: 13, color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildIDDetailRow('Roll Number', '24'),
                  _buildIDDetailRow('Admission No', 'DD/2023/1042'),
                  _buildIDDetailRow('Date of Birth', '12 May 2010'),
                  _buildIDDetailRow('Blood Group', 'B+ Positive'),
                  _buildIDDetailRow('Contact', '+91 98765 43210'),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.qr_code_2_rounded, size: 45, color: AppColors.textPrimary),
            ),
            const SizedBox(height: 8),
            const Text('H-42, Green Park Ext., New Delhi', style: TextStyle(fontSize: 9, color: AppColors.textSecondary)),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildBackSide() {
    return Container(
      width: 300,
      height: 520, // Match front side height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 30, offset: const Offset(0, 15))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: const Center(child: Text('IDENTITY CARD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1))),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SCHOOL RULES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.primary)),
                  SizedBox(height: 6),
                  Text('• Student must wear the ID card at all times.\n• In case of loss, report to the school office immediately.\n• This card is non-transferable.', style: TextStyle(fontSize: 10, height: 1.5)),
                  SizedBox(height: 16),
                  Text('EMERGENCY CONTACT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.primary)),
                  SizedBox(height: 6),
                  Text('School Office: +91 11 2345 6789\nEmergency: 100 / 102', style: TextStyle(fontSize: 10, height: 1.5)),
                  SizedBox(height: 16),
                  Text('TRANSPORT DETAILS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.primary)),
                  SizedBox(height: 6),
                  Text('Route: 12 (Saket)\nBus No: DL 1P C 2041', style: TextStyle(fontSize: 10, height: 1.5)),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.gesture_rounded, color: AppColors.textSecondary, size: 28),
                      const SizedBox(height: 2),
                      Text('PRINCIPAL', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.textPrimary.withOpacity(0.7))),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildIDDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

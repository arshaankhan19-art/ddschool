import 'user_role.dart';

class AppUser {
  final String id;
  final String email;
  final String fullName;
  final UserRole role;
  final String? phone;
  final String? schoolId;

  AppUser({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    this.phone,
    this.schoolId,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    // Extract role_name from the joined roles table
    final rolesData = map['roles'];
    String? roleName;
    if (rolesData is Map) {
      roleName = rolesData['role_name'] as String?;
    } else if (rolesData is List && rolesData.isNotEmpty) {
      roleName = rolesData[0]['role_name'] as String?;
    }

    return AppUser(
      id: map['id'] as String,
      email: map['email'] as String,
      fullName: map['full_name'] as String? ?? '',
      role: UserRole.fromString(roleName),
      phone: map['phone'] as String?,
      schoolId: map['school_id']?.toString(),
    );
  }
}

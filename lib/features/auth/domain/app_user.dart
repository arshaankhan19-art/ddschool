import 'user_role.dart';

class AppUser {
  final String id;
  final String email;
  final UserRole role;

  AppUser({
    required this.id,
    required this.email,
    required this.role,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      email: map['email'] as String,
      role: UserRole.fromString(map['role'] as String?),
    );
  }
}

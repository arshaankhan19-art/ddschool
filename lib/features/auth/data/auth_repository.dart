import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../domain/app_user.dart';
import '../domain/user_role.dart';

class AuthRepository {
  final SupabaseClient _client;

  AuthRepository(this._client);

  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;

  User? get currentUser => _client.auth.currentUser;

  Future<AppUser?> getCurrentUserData() async {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    try {
      debugPrint('Fetching user data for ID: ${user.id}');
      final response = await _client
          .from('users')
          .select('''
            *,
            roles!users_role_id_fkey (
              role_name
            )
          ''')
          .eq('id', user.id)
          .single();

      debugPrint('User fetch result: $response');
      return AppUser.fromMap(response);
    } catch (e) {
      debugPrint('Error fetching user data: $e');
      return null;
    }
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    debugPrint('Attempting sign in for email: $email');
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    debugPrint('Auth success for user ID: ${response.user?.id}');
    return response;
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    String? phone,
  }) async {
    debugPrint('Attempting sign up for email: $email');
    
    // 1. Sign up the user in Supabase Auth
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': fullName},
    );

    if (response.user != null) {
      debugPrint('Auth sign up success. User ID: ${response.user!.id}');
      
      try {
        // 2. Fetch the role_id from the roles table
        final roleData = await _client
            .from('roles')
            .select('id')
            .eq('role_name', role.value)
            .single();
        
        final roleId = roleData['id'];
        debugPrint('Found role_id: $roleId for role: ${role.value}');

        // 3. Create user entry in public.users table
        await _client.from('users').insert({
          'id': response.user!.id,
          'email': email,
          'full_name': fullName,
          'role_id': roleId,
          'phone': phone,
          'created_at': DateTime.now().toIso8601String(),
        });
        debugPrint('Public user profile created successfully');
      } catch (e) {
        debugPrint('Error creating public user profile: $e');
        // We might want to handle this (e.g., delete the auth user or notify the user)
        rethrow;
      }
    }
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/snackbar_helper.dart';
import '../domain/user_role.dart';
import 'auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    debugPrint('--- Login Process Started ---');

    try {
      final authRepo = ref.read(authRepositoryProvider);
      
      // 1. Authenticate with Supabase Auth
      final response = await authRepo.signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      
      if (response.user == null) {
        throw 'Authentication failed. Please check your credentials.';
      }
      
      debugPrint('Auth successful. User ID: ${response.user!.id}');

      // 2. Fetch User Profile from public.users with Roles join
      // We manually refresh the provider or call the repo directly to ensure we have the data
      final userData = await authRepo.getCurrentUserData();
      
      if (userData == null) {
        debugPrint('Login Error: No profile found in public.users');
        if (mounted) {
          SnackbarHelper.showError(context, 'User profile not found.');
        }
        // Sign out if no profile exists to keep state clean
        await authRepo.signOut();
        return;
      }

      debugPrint('Role fetch success: ${userData.role.value}');

      // 3. Role-based navigation
      if (mounted) {
        switch (userData.role) {
          case UserRole.superAdmin:
            context.goNamed('admin');
            break;
          case UserRole.schoolAdmin:
            context.goNamed('school-admin');
            break;
          case UserRole.principal:
            context.goNamed('principal');
            break;
          case UserRole.teacher:
            context.goNamed('teacher');
            break;
          case UserRole.student:
            context.goNamed('student');
            break;
          case UserRole.parent:
            context.goNamed('parent');
            break;
          default:
            SnackbarHelper.showError(context, 'Unauthorized access or unknown role.');
            await authRepo.signOut();
        }
      }
    } catch (e) {
      debugPrint('Login Error: $e');
      if (mounted) {
        SnackbarHelper.showError(context, e.toString().replaceAll('Exception: ', ''));
      }
    } finally {
      // 4. Always stop loading
      if (mounted) {
        setState(() => _isLoading = false);
      }
      debugPrint('--- Login Process Finished ---');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.surfaceColor, AppTheme.backgroundColor],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.school_rounded,
                      size: 80,
                      color: AppTheme.primaryColor,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Welcome to ddschool',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Sign in to continue your journey',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 40),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _emailController,
                              label: 'Email',
                              hint: 'Enter your email',
                              prefixIcon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) return 'Please enter your email';
                                if (!value.contains('@')) return 'Please enter a valid email';
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: _passwordController,
                              label: 'Password',
                              hint: 'Enter your password',
                              prefixIcon: Icons.lock_outline,
                              obscureText: _obscurePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                  color: AppTheme.primaryColor.withOpacity(0.7),
                                ),
                                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) return 'Please enter your password';
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            CustomButton(
                              text: 'Sign In',
                              isLoading: _isLoading,
                              onPressed: _login,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () => context.pushNamed('signup'),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/features/auth/screens/sign_in_screen.dart';

void main() {
  runApp(const DDSchoolApp());
}

class DDSchoolApp extends StatelessWidget {
  const DDSchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DD School',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SignInScreen(),
    );
  }
}

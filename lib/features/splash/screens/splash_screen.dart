import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ddschool/features/auth/screens/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  double _loadingProgress = 0.0;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _progressController.addListener(() {
      setState(() {
        _loadingProgress = _progressController.value;
      });
      if (_progressController.isCompleted && !_isNavigating) {
        _isNavigating = true;
        _navigateToSignIn();
      }
    });

    _progressController.forward();
  }

  void _navigateToSignIn() {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const SignInScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    }
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Background color matched to GIF (#7FC3CC) for seamless blending
    const Color splashBgColor = Color(0xFF7FC3CC);
    
    return Scaffold(
      backgroundColor: splashBgColor, 
      body: Stack(
        children: [
          // Center Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // The Uploaded GIF - Seamlessly integrated
                Image.asset(
                  'assets/animations/ddschool_intro.gif',
                  width: 250, // Optimal size within 220-260 range
                  fit: BoxFit.contain,
                ),
                
                const SizedBox(height: 20),

                // Branding - Color matched for premium integration
                const Text(
                  'DD SCHOOL',
                  style: TextStyle(
                    color: Color(0xFF0F7A5C), // DD School Green for better contrast on teal
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 6,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Smart School, Smart Future',
                  style: TextStyle(
                    color: const Color(0xFF0F7A5C).withValues(alpha: 0.6),
                    fontSize: 14,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Bottom Loading Section
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Loading... ${(_loadingProgress * 100).toInt()}%',
                  style: TextStyle(
                    color: const Color(0xFF0F7A5C).withValues(alpha: 0.5),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 20),
                _buildLoadingBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingBar() {
    const double barWidth = 220.0;
    return Container(
      width: barWidth,
      height: 3, // Slightly thicker for visibility on light background
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Track
          Container(
            width: barWidth,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0xFF0F7A5C).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Progress
          Container(
            width: barWidth * _loadingProgress,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0xFF0F7A5C), // DD School Green
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF0F7A5C).withValues(alpha: 0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),

          // Orbiting Particle / Glow on Bar
          Positioned(
            left: (barWidth * _loadingProgress) - 3,
            top: -2,
            child: Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF0F7A5C),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

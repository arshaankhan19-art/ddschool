import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/routing/app_router.dart';
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';

/// The entry point of the ddschool application.
/// It initializes environment variables, Supabase, and starts the Flutter app.
void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Load environment variables (.env file must be in the assets section of pubspec.yaml)
    await dotenv.load(fileName: AppConstants.envFileName).catchError((e) {
      debugPrint('DotEnv load error: $e. Using default values if possible.');
    });

    // Initialize Supabase Client
    await Supabase.initialize(
      url: dotenv.env[AppConstants.supabaseUrlKey] ?? '',
      anonKey: dotenv.env[AppConstants.supabaseAnonKey] ?? '',
    );
  } catch (e) {
    debugPrint('Critical Initialization Error: $e');
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the router provider to handle navigation
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      
      // Premium Warm Theme Configuration
      theme: AppTheme.lightTheme,
      
      // GoRouter Configuration
      routerConfig: router,
    );
  }
}

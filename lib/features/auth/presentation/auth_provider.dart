import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/auth_repository.dart';
import '../domain/app_user.dart';
import '../../../core/providers/supabase_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return AuthRepository(client);
});

final authStateProvider = StreamProvider((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});

final currentUserDataProvider = FutureProvider<AppUser?>((ref) async {
  final authState = ref.watch(authStateProvider);
  
  return authState.when(
    data: (state) async {
      if (state.session == null) return null;
      return await ref.watch(authRepositoryProvider).getCurrentUserData();
    },
    loading: () => null,
    error: (_, __) => null,
  );
});

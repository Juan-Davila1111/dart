import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luxebeauty/injection_container.dart';
import 'package:luxebeauty/features/auth/domain/entities/user.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  AuthNotifier() : super(const AsyncValue.loading()) {
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    state = await AsyncValue.guard(() async {
      return await InjectionContainer.getCurrentUserUseCase();
    });
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await InjectionContainer.loginUseCase(email, password);
    });
  }

  Future<void> logout() async {
    await InjectionContainer.logoutUseCase();
    state = const AsyncValue.data(null);
  }
}

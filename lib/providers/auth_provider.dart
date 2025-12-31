import 'package:flutter_riverpod/legacy.dart';

enum AuthState { initial, loading, authenticated, unauthenticated }

final authProvider = StateNotifierProvider<AuthProvider, AuthViewModel>((ref) {
  return AuthProvider(AuthViewModel());
});

class AuthProvider extends StateNotifier<AuthViewModel> {
  AuthProvider(super.state);

  Future<void> login(String email, String password) async {
    try {
      state = AuthViewModel(state: AuthState.loading);
      
      // Mock login - no backend needed
      await Future.delayed(const Duration(seconds: 1));
      
      if (email.isNotEmpty && password.isNotEmpty) {
        state = AuthViewModel(
          state: AuthState.authenticated,
          userEmail: email,
        );
      } else {
        state = AuthViewModel(
          state: AuthState.unauthenticated,
          error: 'Invalid credentials',
        );
      }
    } catch (e) {
      state = AuthViewModel(
        state: AuthState.unauthenticated,
        error: e.toString(),
      );
    }
  }

  void logout() {
    state = AuthViewModel(state: AuthState.unauthenticated);
  }
}

class AuthViewModel {
  final AuthState state;
  final String? userEmail;
  final String? error;

  AuthViewModel({
    this.state = AuthState.initial,
    this.userEmail,
    this.error,
  });
}
import 'package:experience_app/features/login/domain/usescases/login_usecase.dart';
import 'package:experience_app/features/login/presentation/state/login_provider.dart';
import 'package:experience_app/features/login/presentation/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final SignInUseCase signInUseCase;

  AuthNotifier(this.signInUseCase) : super(const AuthState());

  Future<void> signIn(String email, String password) async {
    state = state.copyWith(isLoading: true);

    try {
      await signInUseCase(email, password);

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.read(signInUseCaseProvider)),
);

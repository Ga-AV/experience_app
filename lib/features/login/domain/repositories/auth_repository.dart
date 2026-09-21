import 'package:experience_app/features/login/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<AppUser?> signIn(
    String email,
    String password,
  );

  Future<AppUser?> signUp(
    String email,
    String password,
  );

  Future<void> signOut();

  Stream<AppUser?> authStateChanges();
}
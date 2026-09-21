import 'package:experience_app/features/login/data/datasource/auth_remote_datasource.dart';
import 'package:experience_app/features/login/domain/entities/user_entity.dart';
import 'package:experience_app/features/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<AppUser?> signIn(String email, String password) async {
    final credential = await remote.signIn(email, password);

    final user = credential.user;

    if (user == null) return null;

    return AppUser(id: user.uid, email: user.email);
  }

  @override
  Future<AppUser?> signUp(String email, String password) async {
    final credential = await remote.signUp(email, password);

    final user = credential.user;

    if (user == null) return null;

    return AppUser(id: user.uid, email: user.email);
  }

  @override
  Future<void> signOut() {
    return remote.signOut();
  }

  @override
  Stream<AppUser?> authStateChanges() {
    return remote.authStateChanges().map((user) {
      if (user == null) return null;

      return AppUser(id: user.uid, email: user.email);
    });
  }
}

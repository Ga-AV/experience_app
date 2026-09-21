import 'package:experience_app/features/login/data/datasource/auth_remote_datasource.dart';
import 'package:experience_app/features/login/data/repositories/auth_repository_impl.dart';
import 'package:experience_app/features/login/domain/entities/user_entity.dart';
import 'package:experience_app/features/login/domain/repositories/auth_repository.dart';
import 'package:experience_app/features/login/domain/usescases/login_usecase.dart';
import 'package:experience_app/features/login/domain/usescases/logout_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSource(ref.read(firebaseAuthProvider)),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider)),
);

final signInUseCaseProvider = Provider<SignInUseCase>(
  (ref) => SignInUseCase(ref.read(authRepositoryProvider)),
);

final signOutUseCaseProvider = Provider<SignOutUseCase>(
  (ref) => SignOutUseCase(ref.read(authRepositoryProvider)),
);

final authStateProvider = StreamProvider<AppUser?>((ref) {
  return ref.read(authRepositoryProvider).authStateChanges();
});

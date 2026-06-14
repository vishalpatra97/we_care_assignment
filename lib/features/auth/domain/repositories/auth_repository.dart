import 'package:we_care/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signUpWithEmail(
    String email,
    String password,
    String phone,
  );
  Future<UserEntity> signInWithEmail(String email, String password);
  Future<UserEntity> signInWithGoogle();
  Future<UserEntity> signInWithApple();
  Future<UserEntity?> getCurrentUser();
  Future<void> signOut();
  Stream<UserEntity?> get authStateChanges;
}

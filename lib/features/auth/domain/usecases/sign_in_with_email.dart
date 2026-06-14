import '../repositories/auth_repository.dart';
import '../entities/user_entity.dart';

class SignInWithEmailUseCase {
  final AuthRepository repository;

  SignInWithEmailUseCase(this.repository);

  Future<UserEntity> call({
    required String email,
    required String password,
  }) async {
    return await repository.signInWithEmail(email, password);
  }
}

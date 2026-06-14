import '../repositories/auth_repository.dart';
import '../entities/user_entity.dart';

class SignUpWithEmailUseCase {
  final AuthRepository repository;

  SignUpWithEmailUseCase(this.repository);

  Future<UserEntity> call({
    required String email,
    required String password,
    required String phone,
  }) async {
    return await repository.signUpWithEmail(email, password, phone);
  }
}

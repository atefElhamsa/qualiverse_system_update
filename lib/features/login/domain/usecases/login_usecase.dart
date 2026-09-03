import '../entities/user_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> call({
    required String userNameOrEmail,
    required String password,
  }) async {
    return await repository.login(
      userNameOrEmail: userNameOrEmail,
      password: password,
    );
  }
}

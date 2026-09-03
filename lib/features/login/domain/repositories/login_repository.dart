import '../entities/user_entity.dart';

abstract class LoginRepository {
  Future<UserEntity> login({
    required String userNameOrEmail,
    required String password,
  });
}

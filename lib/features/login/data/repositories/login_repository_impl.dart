import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> login({
    required String userNameOrEmail,
    required String password,
  }) async {
    final model = await remoteDataSource.login(
      userNameOrEmail: userNameOrEmail,
      password: password,
    );
    return model.toEntity();
  }
}

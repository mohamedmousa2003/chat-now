import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_firebase_datasource.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<LoginEntity> login(LoginEntity entity) async {
    final model = LoginModel.fromEntity(entity);
    final result = await dataSource.login(model);
    return LoginEntity(email: result.email, password: result.password);
  }

  @override
  Future<RegisterEntity> register(RegisterEntity entity) async {
    final model = RegisterModel.fromEntity(entity);
    final result = await dataSource.register(model);
    return RegisterEntity(
      firstName: result.firstName,
      lastName: result.lastName,
      email: result.email,
      password: result.password,
    );
  }
}

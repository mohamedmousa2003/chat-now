import 'package:chat_now/features/login/data/data_sources/login_data_source.dart';
import 'package:chat_now/features/login/domain/entities/login_entity.dart';
import 'package:chat_now/features/login/domain/repositories/login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo{
  final LoginDataSource _loginDataSource;
  @factoryMethod
  LoginRepoImpl(this._loginDataSource);

  @override
  Future<LoginEntity> login(String email, String password) async{
    final response =await _loginDataSource.login(email, password);
    return response;

  }

}
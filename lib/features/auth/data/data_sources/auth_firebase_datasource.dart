import '../models/login_model.dart';
import '../models/register_model.dart';

abstract class AuthFirebaseDataSource {

  Future<LoginModel> login(LoginModel model);
  Future<RegisterModel> register(RegisterModel model);

}


import 'package:chat_now/features/login/domain/repositories/login_repo.dart';
import 'package:injectable/injectable.dart';

import '../entities/login_entity.dart';

@injectable
class LoginUseCase {
  final LoginRepo _loginRepo;
  LoginUseCase(this._loginRepo);
  Future<LoginEntity> call(String email, String password){
    return _loginRepo.login(email, password);
  }
}
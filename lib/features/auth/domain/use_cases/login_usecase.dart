import 'package:chat/features/auth/domain/entities/login_entity.dart';

import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);
  Future<void> call(LoginEntity entity) {
    return repository.login(entity);
  }
}

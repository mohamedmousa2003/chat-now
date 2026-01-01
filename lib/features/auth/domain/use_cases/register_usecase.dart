import 'package:chat/features/auth/domain/entities/register_entity.dart';
import '../repositories/auth_repository.dart';
class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);
  Future<void> call(RegisterEntity entity) {
    return repository.register(entity);
  }
}
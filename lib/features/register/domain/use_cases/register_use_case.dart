import 'package:injectable/injectable.dart';

import '../entities/register_entity.dart';
import '../repositories/register_repo_contract.dart';

@injectable
class RegisterUseCase {
  final RegisterRepo _registerRepo;

  RegisterUseCase(this._registerRepo);

  Future<RegisterEntity> call(RegisterEntity entity) {
    return _registerRepo.register(entity);
  }
}
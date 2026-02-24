import '../entities/register_entity.dart';

abstract interface class RegisterRepo {
  Future<RegisterEntity> register(RegisterEntity entity);
}
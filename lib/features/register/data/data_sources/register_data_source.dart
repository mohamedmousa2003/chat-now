import '../../domain/entities/register_entity.dart';

abstract interface class RegisterDataSource {
  Future<RegisterEntity> register(RegisterEntity entity);
}
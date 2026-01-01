import '../../domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
  });

  factory RegisterModel.fromEntity(RegisterEntity entity) {
    return RegisterModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      password: entity.password,
    );
  }
}

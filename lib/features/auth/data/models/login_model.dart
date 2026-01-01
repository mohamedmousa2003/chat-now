import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({required super.email, required super.password,});

  factory LoginModel.fromEntity(LoginEntity entity) {
    return LoginModel(email: entity.email, password: entity.password,);
  }

}


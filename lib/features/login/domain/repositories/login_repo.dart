import 'package:chat_now/features/login/domain/entities/login_entity.dart';

abstract interface class LoginRepo {
  Future<LoginEntity> login(String email ,String password);
}
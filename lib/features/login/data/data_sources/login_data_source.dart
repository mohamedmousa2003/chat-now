import 'package:chat_now/features/login/domain/entities/login_entity.dart';

abstract interface class LoginDataSource {
  Future<LoginEntity> login(String email, String password);
}
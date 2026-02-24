import 'package:chat_now/features/login/data/data_sources/login_data_source.dart';
import 'package:chat_now/features/login/domain/entities/login_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/firebase_error.dart';


@Injectable(as: LoginDataSource)
class LoginDataSourceImpl implements LoginDataSource {

  @override
  Future<LoginEntity> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      return LoginEntity(
        user?.email ?? email,
        password,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.userNotFound) {
        throw Exception('No user found for that email');
      } else if (e.code == FirebaseError.wrongPassword) {
        throw Exception('Wrong password');
      } else {
        throw Exception(e.message);
      }
    }
  }
}
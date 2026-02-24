import 'package:chat_now/features/register/data/data_sources/register_data_source.dart';
import 'package:chat_now/features/register/domain/entities/register_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: RegisterDataSource)
class RegisterDataSourceImpl implements RegisterDataSource {

  @override
  Future<RegisterEntity> register(RegisterEntity entity) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: entity.email,
        password: entity.password,
      );

      final user = credential.user;

      return RegisterEntity(
        id: user?.uid,
        name: entity.name,
        email: entity.email,
        password: entity.password,
      );

    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
import 'package:firebase_auth/firebase_auth.dart';

import '../models/login_model.dart';
import '../models/register_model.dart';
import 'auth_firebase_datasource.dart';

class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {

  final FirebaseAuth firebaseAuth;
  AuthFirebaseDataSourceImpl(this.firebaseAuth);

  @override
  Future<LoginModel> login(LoginModel model) async {
    UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
      email: model.email,
      password: model.password,
    );
    return LoginModel(email: user.user!.email!, password: model.password);
  }

  @override
  Future<RegisterModel> register(RegisterModel model) async {
    UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
      email: model.email,
      password: model.password,
    );
    return RegisterModel(
      firstName: model.firstName,
      lastName: model.lastName,
      email: user.user!.email!,
      password: model.password,
    );
  }
}

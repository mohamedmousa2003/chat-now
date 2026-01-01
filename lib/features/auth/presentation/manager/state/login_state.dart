import 'package:chat/features/auth/domain/entities/login_entity.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class InitialLogin extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoadingLogin extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoadedLogin extends LoginState {
  final LoginEntity login;
  LoadedLogin({required this.login});
  @override
  List<Object?> get props => [login];
}

class LoadedLoginSuccess extends LoginState {
  @override
  List<Object?> get props => [];
}

class ErrorLogin extends LoginState {
  final String error;
  ErrorLogin({required this.error});
  @override
  List<Object?> get props => [error];
}

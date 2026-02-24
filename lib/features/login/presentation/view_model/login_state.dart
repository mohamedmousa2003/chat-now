
import 'package:equatable/equatable.dart';

import '../../domain/entities/login_entity.dart';

sealed class LoginState extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginLoaded extends LoginState {
  final LoginEntity success;
  LoginLoaded(this.success);
  @override
  List<Object?> get props => [success];
}
class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
  @override
  List<Object?> get props => [error];
}

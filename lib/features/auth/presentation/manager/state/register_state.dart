import 'package:chat/features/auth/domain/entities/register_entity.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable{
  @override
  List<Object?> get props => [];
}

class InitialRegister extends RegisterState {}

class RegisterLoading extends RegisterState{}

class RegisterLoaded extends RegisterState{
  final RegisterEntity registerEntity;
  RegisterLoaded({required this.registerEntity});
  @override
  List<Object?> get props => [registerEntity];
}

class RegisterError extends RegisterState{
  final String error;
  RegisterError({required this.error});
  @override
  List<Object?> get props => [error];
}
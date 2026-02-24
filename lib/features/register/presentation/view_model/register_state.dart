
import 'package:equatable/equatable.dart';

import '../../domain/entities/register_entity.dart';

sealed class RegisterState extends Equatable{
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}
 class RegisterLoading extends RegisterState {}
 class RegisterLoaded extends RegisterState {
  final RegisterEntity success;
  RegisterLoaded(this.success);
  @override
  List<Object?> get props => [success];
 }
 class RegisterError extends RegisterState {
  final String error;
  RegisterError(this.error);
  @override
  List<Object?> get props => [error];
 }

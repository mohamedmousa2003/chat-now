import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable{
  final String? id;
  final String name;
  final String email;
  final String password; 

  const RegisterEntity({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [id, name, email, password];
}

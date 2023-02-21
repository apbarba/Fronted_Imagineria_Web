import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  final String username;
  final String password;
  final String verifyPassword;
  final String email;
  final String name;

  RegisterButtonPressed({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
    required this.verifyPassword,
  });

  @override
  List<Object> get props => [username, password];
}

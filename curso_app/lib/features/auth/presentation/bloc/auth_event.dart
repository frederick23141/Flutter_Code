import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

//login remoto
class AuthLoginRequested extends AuthEvent {
  final String username;
  final String password;

  const AuthLoginRequested({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

//login local
class AuthLoginLocalRequested extends AuthEvent {
  final String username;
  final String password;

  const AuthLoginLocalRequested({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}

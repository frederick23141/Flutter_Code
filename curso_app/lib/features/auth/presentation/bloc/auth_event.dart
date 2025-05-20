/*abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;

  LoginRequested({required this.username, required this.password});
}
*/
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

  AuthLoginRequested({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

//login local
class AuthLoginLocalRequested extends AuthEvent {
  final String username;
  final String password;

  AuthLoginLocalRequested({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

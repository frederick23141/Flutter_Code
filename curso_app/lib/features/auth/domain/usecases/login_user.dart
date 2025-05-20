import 'package:curso_app/features/auth/domain/entities/auth_user.dart';
import 'package:curso_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<AuthUser?> call(String username, String password) {
    return repository.login(username, password);
  }
}

import 'package:curso_app/features/auth/domain/entities/auth_user.dart';
import 'package:curso_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUserLocal {
  final AuthRepository repository;

  LoginUserLocal(this.repository);

  Future<AuthUser?> call(String username, String password) {
    return repository.loginLocal(username, password);
  }
}

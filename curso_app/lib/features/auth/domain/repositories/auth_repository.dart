import 'package:curso_app/features/auth/domain/entities/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser?> login(String username, String password);
  Future<AuthUser?> loginLocal(String username, String password);
}

import 'package:curso_app/data/datasources/database_helper.dart';
import 'package:curso_app/features/auth/data/models/auth_user_model.dart';

class AuthLocalDatasource {
  final DatabaseHelper dbHelper;

  AuthLocalDatasource(this.dbHelper);

  Future<AuthUserModel?> login(String username, String password) async {
    final userMap = await dbHelper.getUserByCredentials(username, password);
    if (userMap == null) return null;

    return AuthUserModel.fromMap(userMap);
  }
}

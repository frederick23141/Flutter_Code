import 'package:curso_app/data/datasources/database_helper.dart';
import 'package:curso_app/features/auth/data/models/auth_user_model.dart';
import 'package:sqflite/sqflite.dart';

class AuthLocalDatasource {
  final DatabaseHelper dbHelper;

  AuthLocalDatasource(this.dbHelper);

  Future<void> insertOrUpdateUser(AuthUserModel user) async {
    final db = await dbHelper.database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<AuthUserModel?> login(String username, String password) async {
    final db = await dbHelper.database;
    final result = await db.query(
      'users',
      where: 'name = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (result.isNotEmpty) {
      return AuthUserModel.fromMap(result.first);
    } else {
      return null;
    }
  }
}

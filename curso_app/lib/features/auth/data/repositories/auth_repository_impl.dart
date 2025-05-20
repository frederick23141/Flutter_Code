import 'package:curso_app/features/auth/data/datasources/auth_firebase_datasource.dart';
import 'package:curso_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:curso_app/features/auth/data/models/auth_user_model.dart';

import 'package:curso_app/features/auth/domain/entities/auth_user.dart';
import 'package:curso_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDatasource firebase;
  final AuthLocalDatasource local;

  AuthRepositoryImpl({required this.firebase, required this.local});

  @override
  Future<AuthUser?> login(String username, String password) async {
    final userModel = await firebase.login(username, password);
    return userModel?.toEntity();
  }

  @override
  Future<AuthUser?> loginLocal(String username, String password) async {
    final userModel = await local.login(username, password);
    return userModel?.toEntity();
  }

  Future<void> saveUserLocal(AuthUserModel user) async {
    await local.insertOrUpdateUser(user);
  }
}

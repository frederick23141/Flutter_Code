import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_app/data/datasources/database_helper.dart';
import 'package:curso_app/features/auth/data/datasources/auth_firebase_datasource.dart';
import 'package:curso_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:curso_app/features/auth/data/models/auth_user_model.dart';
/* 
class AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AuthUserModel?> login(String username, String password) async {
    final snapshot =
        await _firestore
            .collection('users')
            .where('name', isEqualTo: username)
            .where('password', isEqualTo: password)
            .get();

    if (snapshot.docs.isEmpty) return null;

    final doc = snapshot.docs.first;
    return AuthUserModel.fromMap(doc.data());
  }

  //
  // Login local en SQLite
  Future<AuthUserModel?> loginLocal(String username, String password) async {
    final dbHelper = DatabaseHelper(); // Instancia de la clase
    final userMap = await dbHelper.getUserByCredentials(username, password);
    if (userMap == null) return null;

    return AuthUserModel.fromMap(userMap);
  }

  //AuthUserModel toEntity() => AuthUserModel(job: job, user: user);
}
*/
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
}

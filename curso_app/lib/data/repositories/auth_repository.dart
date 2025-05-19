import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_app/data/datasources/database_helper.dart';
import 'package:curso_app/models/auth/auth_user.dart';

class AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AuthUser?> login(String username, String password) async {
    final snapshot =
        await _firestore
            .collection('users')
            .where('name', isEqualTo: username)
            .where('password', isEqualTo: password)
            .get();

    if (snapshot.docs.isEmpty) return null;

    final doc = snapshot.docs.first;
    return AuthUser.fromMap(doc.data());
  }

  //
  // Login local en SQLite
  Future<AuthUser?> loginLocal(String username, String password) async {
    final dbHelper = DatabaseHelper(); // Instancia de la clase
    final userMap = await dbHelper.getUserByCredentials(username, password);
    if (userMap == null) return null;

    return AuthUser.fromMap(userMap);
  }
}

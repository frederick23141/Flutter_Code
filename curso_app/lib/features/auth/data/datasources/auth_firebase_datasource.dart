import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_app/features/auth/data/models/auth_user_model.dart';

class AuthFirebaseDatasource {
  final FirebaseFirestore firestore;

  AuthFirebaseDatasource(this.firestore);

  Future<AuthUserModel?> login(String username, String password) async {
    final snapshot =
        await firestore
            .collection('users')
            .where('name', isEqualTo: username)
            .where('password', isEqualTo: password)
            .get();

    if (snapshot.docs.isEmpty) return null;

    return AuthUserModel.fromMap(snapshot.docs.first.data());
  }
}

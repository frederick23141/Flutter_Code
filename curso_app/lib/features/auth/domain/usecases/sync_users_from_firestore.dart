import 'package:curso_app/features/auth/data/datasources/auth_firebase_datasource.dart';
import 'package:curso_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:curso_app/features/auth/data/models/auth_user_model.dart';

class SyncUsersFromFirestore {
  final AuthFirebaseDatasource firebase;
  final AuthLocalDatasource local;

  SyncUsersFromFirestore({required this.firebase, required this.local});

  Future<void> call() async {
    final snapshot = await firebase.getAllUsers();

    // Guardar usuarios en SQLite
    for (var doc in snapshot.docs) {
      final data = doc.data();

      final userModel = AuthUserModel(
        // id: doc.id,
        job: data['job'],
        user: data['name'],
        password: data['password'],
      );

      await local.insertOrUpdateUser(userModel);
    }
  }
}

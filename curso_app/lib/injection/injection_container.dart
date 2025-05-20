import 'package:curso_app/data/datasources/database_helper.dart';
import 'package:curso_app/features/auth/data/datasources/auth_firebase_datasource.dart';
import 'package:curso_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:curso_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:curso_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:curso_app/features/auth/domain/usecases/login_user.dart';
import 'package:curso_app/features/auth/domain/usecases/login_user_local.dart';
import 'package:curso_app/features/auth/domain/usecases/sync_users_from_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Core
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton(() => DatabaseHelper());

  // Auth - Datasources
  getIt.registerLazySingleton(() => AuthFirebaseDatasource(getIt()));
  getIt.registerLazySingleton(() => AuthLocalDatasource(getIt()));

  // Auth - Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(firebase: getIt(), local: getIt()),
  );

  // Auth - UseCases
  getIt.registerLazySingleton(() => LoginUser(getIt()));
  getIt.registerLazySingleton(() => LoginUserLocal(getIt()));
  getIt.registerLazySingleton(
    () => SyncUsersFromFirestore(
      firebase: getIt<AuthFirebaseDatasource>(),
      local: getIt<AuthLocalDatasource>(),
    ),
  );
  // Luego: más features
  // getIt.registerLazySingleton(() => ProductRepository(getIt()));
  // getIt.registerLazySingleton(() => GetProducts(getIt()));
}

import 'package:curso_app/features/auth/domain/entities/auth_user.dart';

class AuthUserModel {
  final String job;
  final String user;
  final String password;

  AuthUserModel({
    required this.job,
    required this.user,
    required this.password,
  });

  factory AuthUserModel.fromMap(Map<String, dynamic> map) {
    return AuthUserModel(
      job: map['job'],
      user: map['name'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'job': job, 'name': user, 'password': password};
  }

  //  Este método convierte el modelo a la entidad
  AuthUser toEntity() {
    return AuthUser(job: job, user: user);
  }
}

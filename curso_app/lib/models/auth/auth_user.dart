class AuthUser {
  final String job;
  final String user;
  final String password;

  AuthUser({required this.job, required this.user, required this.password});

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      job: map['job'],
      user: map['name'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'job': job, 'name': user, 'password': password};
  }
}

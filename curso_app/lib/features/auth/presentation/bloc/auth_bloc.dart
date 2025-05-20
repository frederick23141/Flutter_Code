import 'package:curso_app/features/auth/domain/usecases/login_user.dart';
import 'package:curso_app/features/auth/domain/usecases/login_user_local.dart';
import 'package:curso_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:curso_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final LoginUserLocal loginUserLocal;

  AuthBloc({required this.loginUser, required this.loginUserLocal})
    : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLoginLocalRequested>(_onLoginLocalRequested);
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await loginUser(event.username, event.password);
      if (user != null) {
        emit(AuthSuccess(user.user));
      } else {
        emit(AuthFailure(error: 'Credenciales invalidas (Remoto)'));
      }
    } catch (e) {
      emit(AuthFailure(error: 'Error en login remoto ${e.toString()}'));
    }
  }

  Future<void> _onLoginLocalRequested(
    AuthLoginLocalRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInitial());
    try {
      final user = await loginUserLocal(event.username, event.password);
      if (user != null) {
        emit(AuthSuccess(user.user));
      } else {
        emit(AuthFailure(error: 'Error al validar el usuario local'));
      }
    } catch (e) {
      emit(AuthFailure(error: 'Error en login local ${e.toString()}'));
    }
  }
}

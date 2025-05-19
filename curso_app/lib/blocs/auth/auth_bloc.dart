import 'package:curso_app/blocs/auth/auth_event.dart';
import 'package:curso_app/blocs/auth/auth_state.dart';
import 'package:curso_app/data/repositories/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        //FIRESTORE
        //        final user = await authRepository.login(event.username, event.password);

        //LOCAL
        final user = await authRepository.loginLocal(
          event.username,
          event.password,
        );

        if (user != null) {
          emit(AuthSuccess(user.user));
        } else {
          emit(AuthFailure(error: 'Error al autenficar el usuario'));
        }
      } catch (e) {
        emit(AuthFailure(error: 'Error al iniciar sesion : $e'));
      }
    });
  }
}

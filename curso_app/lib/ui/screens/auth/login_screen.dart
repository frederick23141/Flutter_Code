import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_app/blocs/auth/auth_bloc.dart';
import 'package:curso_app/blocs/auth/auth_state.dart';
import 'package:curso_app/core/constants/app_images.dart';
import 'package:curso_app/core/controllers/client/client_controller.dart';
import 'package:curso_app/core/controllers/route/route_controller.dart';
import 'package:curso_app/core/routes/app_routes.dart';
import 'package:curso_app/data/repositories/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:curso_app/core/constants/app_colors.dart';
import 'package:curso_app/ui/screens/auth/components/login_header_screen.dart';
import 'package:curso_app/ui/screens/auth/components/login_page_form_screen.dart';
import 'package:curso_app/ui/screens/auth/components/login_button_screen.dart';
import 'package:curso_app/ui/screens/auth/components/login_button_create_account.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:curso_app/firebase_options.dart' show DefaultFirebaseOptions;
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final EmpresaController empresaController = EmpresaController();
  final RouteController routeController = RouteController();

  Future<void> initializeFirebaseAndLoadUsers() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Carga empresas y rutas después de inicializar Firebase
    await empresaController.cargarEmpresas();
    print('Empresas cargadas: ${empresaController.empresas.length}');
    getEmpresas();

    await routeController.cargarRutas();
    print('rutas encontradas:  ${routeController.routes.length}');
    getRutas();
  }

  List usuarios = [];
  void getEmpresas() async {
    try {
      CollectionReference datos = FirebaseFirestore.instance.collection(
        "empresas",
      );
      QuerySnapshot users = await datos.get();

      if (users.docs.isNotEmpty) {
        for (var doc in users.docs) {
          print(doc.data());
          usuarios.add(doc.data());
        }
      }
    } catch (e) {
      print('Error al obtener usuarios: $e');
    }
  }

  List rutas = [];
  void getRutas() async {
    try {
      CollectionReference datos = FirebaseFirestore.instance.collection(
        'rutas',
      );
      QuerySnapshot route = await datos.get();

      if (route.docs.isNotEmpty) {
        for (var doc in route.docs) {
          print(doc.data());
          rutas.add(doc.data());
        }
      }
    } catch (e) {
      print('Error al cargar las rutas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeFirebaseAndLoadUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras Firebase se inicializa, muestra un loader
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error al inicializar Firebase: ${snapshot.error}'),
            ),
          );
        }

        // Firebase ya inicializado: ahora sí crea el BlocProvider con AuthBloc
        return BlocProvider(
          create: (_) => AuthBloc(authRepository: AuthRepository()),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacementNamed(context, AppRoutes.homescreen);
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.backgroundMain,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LoginHeaderScreen(),
                        LoginPageFormScreen(),
                        const SizedBox(height: 16),
                        LoginButtonCreateAccount(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

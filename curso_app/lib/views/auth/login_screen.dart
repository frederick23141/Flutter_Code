import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_app/core/constants/app_images.dart';
import 'package:curso_app/core/controllers/client/client_controller.dart';
import 'package:curso_app/core/controllers/route/route_controller.dart';
import 'package:curso_app/login.dart';
import 'package:flutter/material.dart';
import 'package:curso_app/core/constants/app_colors.dart';
import 'package:curso_app/views/auth/components/login_header_screen.dart';
import 'package:curso_app/views/auth/components/login_page_form_screen.dart';
import 'package:curso_app/views/auth/components/login_button_screen.dart';
import 'package:curso_app/views/auth/components/login_button_create_account.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:curso_app/firebase_options.dart' show DefaultFirebaseOptions;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    initializeFirebaseAndLoadUsers();
  }

  final EmpresaController empresaController = EmpresaController();
  final RouteController routeController = RouteController();

  Future<void> initializeFirebaseAndLoadUsers() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    //test
    await empresaController.cargarEmpresas();
    print('Empresas cargadas: ${empresaController.empresas.length}');
    //confirm users
    getUsers();

    await routeController.cargarRutas();
    print('rutas encontradas:  ${routeController.routes.length}');
    getRutas();
  }

  //* METODO PARA OBTENER LOS DATOS DE FIRESTORE DE CLIENTES
  List usaurios = [];
  void getUsers() async {
    try {
      // Asegúrate de que Firebase esté inicializado antes de acceder a Firestore
      CollectionReference datos = FirebaseFirestore.instance.collection(
        "empresas",
      );
      QuerySnapshot users = await datos.get();

      if (users.docs.isNotEmpty) {
        for (var doc in users.docs) {
          print(doc.data());
          usaurios.add(
            doc.data(),
          ); // Corregido: debe ser doc.data() y no doc.data
        }
      }
    } catch (e) {
      print('Error al obtener usuarios: $e');
      if (e is FirebaseException) {
        // print('FirebaseException code: ${e.code}');
        // print('Message: ${e.message}');
        // print('Plugin: ${e.plugin}');
      }
    }
  }

  //* METODO PARA OBTENER LOS DATOS DE FIRESTORE DE RUTAS
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
    return Scaffold(
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
    );
  }
}

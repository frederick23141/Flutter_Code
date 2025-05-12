import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_app/core/controllers/client/client_controller.dart';
import 'package:curso_app/core/controllers/route/route_controller.dart';
import 'package:curso_app/views/auth/components/login_header.dart';
import 'package:curso_app/views/auth/components/login_page_form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:curso_app/firebase_options.dart' show DefaultFirebaseOptions;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    initializeFirebaseAndLoadUsers();
  }

  final RouteController rutaController = RouteController();
  // final EmpresaController empresaController = EmpresaController();

  //*Inicializar firebase
  Future<void> initializeFirebaseAndLoadUsers() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    /* await empresaController.cargarEmpresas();
    print('Empresas cargadas: ${empresaController.empresas.length}');
    //confirm users
    getUsers();
*/
    //obtener rutas
    await rutaController.cargarRutas();
    print('Rutas encontradas: ${rutaController.routes.length} ');
    getRutas();
  }

  /*
  List usaurios = [];
  void getUsers() async {
    try {
      // Asegúrate de que Firebase esté inicializado antes de acceder a Firestore
      CollectionReference datosruta = FirebaseFirestore.instance.collection(
        "empresas",
      );
      QuerySnapshot users = await datosruta.get();

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
*/
  List rutas = [];
  void getRutas() async {
    try {
      CollectionReference datos = FirebaseFirestore.instance.collection(
        "rutas",
      );
      QuerySnapshot route = await datos.get();

      if (route.docs.isNotEmpty) {
        for (var docs in route.docs) {
          print(docs.data());
          rutas.add(docs.data());
        }
      }
    } catch (e) {
      print('Error al obtener las rutas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginPageHeader(),
                LoginPageForm(),
                // SizedBox(height: AppDefaults.padding),
                // DontHaveAccountRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

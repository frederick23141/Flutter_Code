import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_app/firebase_options.dart';
import 'package:curso_app/pages/principal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Asegúrate de que Firebase se haya inicializado
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange, // <- fuerza el color del AppBar
          foregroundColor: Colors.white, // <- texto e íconos blancos
        ),
      ),
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});
  @override
  State<Inicio> createState() => _HomeState();
}

class _HomeState extends State<Inicio> {
  final TextEditingController _controller = TextEditingController(text: "");
  String? usuario;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Obtener datos de Firebase
  void getUsers() async {
    try {
      // Asegúrate de que Firebase esté inicializado antes de acceder a Firestore
      CollectionReference datos = FirebaseFirestore.instance.collection(
        "users",
      );
      QuerySnapshot users = await datos.get();

      if (users.docs.isNotEmpty) {
        for (var doc in users.docs) {
          print(doc.data()); // Corregido: debe ser doc.data() y no doc.data
        }
      }
    } catch (e) {
      print('Error al obtener usuarios: $e');
    }
  }

  // Guardar datos de manera local
  _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("Usuario", usuario.toString());
    });
  }

  // Cargar datos desde SharedPreferences
  _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _controller.text = prefs.getString("Usuario").toString();
      getUsers();
    });
    // Aquí ya podemos llamar a getUsers, ya que la inicialización de Firebase ha sido completada
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Asesor Movil"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: (30))),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image(image: AssetImage("assets/lapp.png")),
            Text("Asesor Movil"),
            SizedBox(height: 40),
            campoUsuario(_controller),
            SizedBox(height: 10),
            campoContrasena(),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 150.0,
                    vertical: 15.0,
                  ),
                ),
                child: const Text("Ingresar", style: TextStyle(fontSize: 20.0)),
                onPressed: () {
                  usuario = _controller.text;
                  _savePreferences();
                  // Navegar a la pantalla principal
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => principal(_controller.text),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget campoUsuario(TextEditingController controller) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "Usuario",
        hintText: "Ingrese su usuario",
        icon: Icon(Icons.person),
        iconColor: Colors.deepOrange,
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget campoContrasena() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
    child: TextField(
      decoration: InputDecoration(
        labelText: "Contraseña",
        hintText: "Ingrese su contraseña",
        fillColor: Colors.white,
        filled: true,
        icon: Icon(Icons.lock),
        iconColor: Colors.deepOrange,
      ),
      obscureText: true,
    ),
  );
}

import 'package:curso_app/pages/dashboard.dart';
import 'package:curso_app/pages/principal.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(Login());

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
  final TextEditingController _controller = TextEditingController();
  String? usuario;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPreferences();
  }

  //guardar datos de manera local, usamos para tema, usuario, y algunas configuraciones
  _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("Usuario", usuario.toString());
    });
  }

  _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _controller.text = prefs.getString("Usuario").toString();
    });
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
                  //metodo para navegar a la segunda pantalla
                  //Navigator es una clase que permite navegar entre pantallas en Flutter.
                  Navigator.push(
                    context,
                    //materialPageRoute es un widget que permite navegar entre pantallas con estilo material.
                    MaterialPageRoute(builder: (context) => principal()),
                    //MaterialPageRoute(builder: (context) => Dashboard()),
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

Widget campoUsuario(TextEditingController _controller) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
    child: TextField(
      controller: _controller,
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

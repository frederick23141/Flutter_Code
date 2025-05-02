import 'package:flutter/material.dart';
import 'package:curso_app/pages/navmenu.dart';
import 'package:curso_app/pages/models/empresa.dart';
import 'package:curso_app/pages/models/persona.dart';

//void main() => runApp(principal());

class principal extends StatelessWidget {
  const principal({super.key});

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
  //llamamos la clase empresa par ausarla desde api
  Empresa empresa = Empresa("sic", "", 0);
  //lista
  List<Persona> personas = [
    Persona("Andrea", "gonzzalez", "1232123"),
    Persona("camilo", "toro", "40642231"),
  ];

  @override
  void initState() {
    super.initState();
    //llamamos la funcion de la clase empresa para que se ejecute al iniciar la app
    print(empresa.nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(title: Text("Gestión movil")),
        drawer: Drawer(
          child: MenuOpciones(),
          // Aquí insertas el widget personalizado
        ),
        body: Center(child: Text("Contenido principal")),
      ),
    );
  }
}

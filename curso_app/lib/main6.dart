import 'package:curso_app/pages/dashboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(MiApp6());

class MiApp6 extends StatelessWidget {
  const MiApp6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // <- fuerza el color del AppBar
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navegacion")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home"),
            ElevatedButton(
              child: const Text("Ir a la segunda pantalla"),
              onPressed: () {
                //metodo para navegar a la segunda pantalla
                //Navigator es una clase que permite navegar entre pantallas en Flutter.
                Navigator.push(
                  context,
                  //materialPageRoute es un widget que permite navegar entre pantallas con estilo material.
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

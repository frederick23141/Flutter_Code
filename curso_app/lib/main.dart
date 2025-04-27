import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: cuerpo());
  }
}

//wigdwet separados para el cuerpo
Widget cuerpo() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          "https://cdn3.f-cdn.com/contestentries/1578585/36360275/5d613e08b4f05_thumb900.jpg",
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(child: titulo()),
  );
}

//wigdget separados para el titulo
Widget titulo() {
  return Text(
    "Ingresar",
    style: TextStyle(color: Colors.black, fontSize: 20.0),
  );
}

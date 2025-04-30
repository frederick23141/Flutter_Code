import 'package:flutter/material.dart';
import 'package:curso_app/pages/navmenu.dart';
import 'package:curso_app/pages/pagelist.dart';
import 'package:curso_app/pages/components/card.dart';

void main() => runApp(pagelist());

class pagelist extends StatelessWidget {
  const pagelist({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(title: Text("Clientes")),
        drawer: Drawer(
          child: MenuOpciones(),

          // Aquí insertas el widget personalizado
        ),
        body: ListView.builder(
          itemCount: 10, // Número de veces que quieres mostrar el card
          itemBuilder: (context, index) {
            return EmpresaCard(
              nombre: 'Empresa #$index',
              nit: 'NIT-000$index',
              estado: index % 2 == 0 ? 'Activo' : 'Inactivo',
            );
          },
        ),
      ),
    );
  }
}

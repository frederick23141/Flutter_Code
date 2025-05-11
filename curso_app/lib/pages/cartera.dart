import 'package:curso_app/pages/components/carteracomponent.dart';
import 'package:curso_app/pages/components/carteradetallecomponent.dart';
import 'package:curso_app/views/drawer/drawer_menu.dart';
import 'package:flutter/material.dart';

//void main() => runApp(cartera());

String filtro = "";

class cartera extends StatelessWidget {
  const cartera({super.key});

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
        appBar: AppBar(title: Text("Cartera General")),
        drawer: Drawer(
          child: DrawerMenu(),
          // Aquí insertas el widget personalizado
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Buscar Factura',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final nombre = 'Semana #$index';
                  if (filtro.isNotEmpty &&
                      !nombre.toLowerCase().contains(filtro)) {
                    return SizedBox.shrink(); // Oculta si no coincide con búsqueda
                  }

                  return carteracomponent(
                    ruta: nombre,
                    clientes: index,
                    visitados: index,
                    efectivos: 2,
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  final nombre = 'Semana #$index';
                  if (filtro.isNotEmpty &&
                      !nombre.toLowerCase().contains(filtro)) {
                    return SizedBox.shrink(); // Oculta si no coincide con búsqueda
                  }

                  return carteradetallecomponent(
                    ruta: nombre,
                    clientes: index,
                    visitados: index,
                    efectivos: 2,
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

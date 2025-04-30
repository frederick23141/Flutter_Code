import 'package:flutter/material.dart';
import 'package:curso_app/pages/navmenu.dart';
import 'package:curso_app/pages/routelist.dart';
import 'package:curso_app/pages/components/ruteuser.dart';

void main() => runApp(routelist());

String filtro = "";

class routelist extends StatelessWidget {
  const routelist({super.key});

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
        appBar: AppBar(title: Text("Ruta")),
        drawer: Drawer(
          child: MenuOpciones(),
          // Aquí insertas el widget personalizado
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Buscar empresa',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (valor) {
                  setState(() {
                    filtro = valor.toLowerCase();
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final nombre = 'Semana #$index';
                  if (filtro.isNotEmpty &&
                      !nombre.toLowerCase().contains(filtro)) {
                    return SizedBox.shrink(); // Oculta si no coincide con búsqueda
                  }

                  return CardRoute(
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

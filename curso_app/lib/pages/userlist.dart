import 'package:flutter/material.dart';
import 'package:curso_app/pages/navmenu.dart';
import 'package:curso_app/pages/userlist.dart';
import 'package:curso_app/pages/components/cardclient.dart';

//void main() => runApp(userlist());

String filtro = "";

// Lista de empresas de ejemplo esto deberia estar en una base de datos o en api o en un json aparte.
final List<EmpresaCard> empresas = [
  EmpresaCard(
    nombre: 'Empresa A',
    nit: 'NIT-0001',
    estado: 'Activo',
    direccion: 'Cra 1 #12-1',
  ),
  EmpresaCard(
    nombre: 'Empresa B',
    nit: 'NIT-0002',
    estado: 'Inactivo',
    direccion: 'Cra 2 #13-1',
  ),
  EmpresaCard(
    nombre: 'Empresa C',
    nit: 'NIT-0003',
    estado: 'Activo',
    direccion: 'Cra 3 #14-1',
  ),
  EmpresaCard(
    nombre: 'Empresa D',
    nit: 'NIT-0004',
    estado: 'Inactivo',
    direccion: 'Cra 4 #15-1',
  ),
  EmpresaCard(
    nombre: 'Empresa E',
    nit: 'NIT-0005',
    estado: 'Activo',
    direccion: 'Cra 5 #16-1',
  ),
  EmpresaCard(
    nombre: 'Empresa F',
    nit: 'NIT-0006',
    estado: 'Inactivo',
    direccion: 'Cra 6 #17-1',
  ),
  EmpresaCard(
    nombre: 'Empresa G',
    nit: 'NIT-0007',
    estado: 'Activo',
    direccion: 'Cra 7 #18-1',
  ),
  EmpresaCard(
    nombre: 'Empresa H',
    nit: 'NIT-0008',
    estado: 'Inactivo',
    direccion: 'Cra 8 #19-1',
  ),
  EmpresaCard(
    nombre: 'Empresa I',
    nit: 'NIT-0009',
    estado: 'Activo',
    direccion: 'Cra 9 #20-1',
  ),
  EmpresaCard(
    nombre: 'Empresa J',
    nit: 'NIT-0010',
    estado: 'Inactivo',
    direccion: 'Cra 10 #21-1',
  ),
  EmpresaCard(
    nombre: 'Empresa K',
    nit: 'NIT-0011',
    estado: 'Activo',
    direccion: 'Cra 11 #22-1',
  ),
  EmpresaCard(
    nombre: 'Empresa L',
    nit: 'NIT-0012',
    estado: 'Inactivo',
    direccion: 'Cra 12 #23-1',
  ),
  EmpresaCard(
    nombre: 'Empresa M',
    nit: 'NIT-0013',
    estado: 'Activo',
    direccion: 'Cra 13 #24-1',
  ),
  EmpresaCard(
    nombre: 'Empresa N',
    nit: 'NIT-0014',
    estado: 'Inactivo',
    direccion: 'Cra 14 #25-1',
  ),
  EmpresaCard(
    nombre: 'Empresa O',
    nit: 'NIT-0015',
    estado: 'Activo',
    direccion: 'Cra 15 #26-1',
  ),
  EmpresaCard(
    nombre: 'Empresa P',
    nit: 'NIT-0016',
    estado: 'Inactivo',
    direccion: 'Cra 16 #27-1',
  ),
  EmpresaCard(
    nombre: 'Empresa Q',
    nit: 'NIT-0017',
    estado: 'Activo',
    direccion: 'Cra 17 #28-1',
  ),
  EmpresaCard(
    nombre: 'Empresa R',
    nit: 'NIT-0018',
    estado: 'Inactivo',
    direccion: 'Cra 18 #29-1',
  ),
  EmpresaCard(
    nombre: 'Empresa S',
    nit: 'NIT-0019',
    estado: 'Activo',
    direccion: 'Cra 19 #30-1',
  ),
  EmpresaCard(
    nombre: 'Empresa T',
    nit: 'NIT-0020',
    estado: 'Inactivo',
    direccion: 'Cra 20 #31-1',
  ),
];

class userlist extends StatelessWidget {
  const userlist({super.key});

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
                itemCount: empresas.length,
                itemBuilder: (context, index) {
                  final nombre = 'Empresa #$index';
                  if (filtro.isNotEmpty &&
                      !nombre.toLowerCase().contains(filtro)) {
                    return SizedBox.shrink(); // Oculta si no coincide con búsqueda
                  }

                  return EmpresaCard(
                    nombre: empresas[index].nombre,
                    nit: empresas[index].nit,
                    estado: empresas[index].estado,
                    direccion: empresas[index].direccion,
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

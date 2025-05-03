import 'package:curso_app/login.dart';
import 'package:curso_app/pages/principal.dart';
import 'package:curso_app/pages/routelist.dart';
import 'package:curso_app/pages/userlist.dart';
import 'package:curso_app/pages/cartera.dart';
import 'package:curso_app/pages/gifpage.dart';
import 'package:flutter/material.dart';

class MenuOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //agregar icono de usuario y nombre del asesor
        Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person),
              Text("Asesor con ingreso", style: TextStyle(fontSize: 14.0)),
            ],
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Central', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Inicio
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => principal()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Novedades', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Configuración
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => cartera()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person_add_alt),
          title: Text('Clientes', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Acerca de
            Navigator.push(
              context,
              //materialPageRoute es un widget que permite navegar entre pantallas con estilo material.
              MaterialPageRoute(builder: (context) => userlist()),
              //MaterialPageRoute(builder: (context) => Dashboard()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.route),
          title: Text('Rutas', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Acerca de
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => routelist()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.calendar_month),
          title: Text('Agenda', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.category_sharp),
          title: Text('Catalogo', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Acerca de
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GifPage()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: Text('Buscar', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.document_scanner),
          title: Text('Cotizacion', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.pie_chart),
          title: Text('Estadisticas', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('Consignaciones', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.cloud_download),
          title: Text('Cierre de rutas', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Acerca de
          },
        ),

        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Configuración', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Cerrar sesión', style: TextStyle(fontSize: 14.0)),
          onTap: () {
            // Acción para Acerca de
            Navigator.push(
              context,
              //materialPageRoute es un widget que permite navegar entre pantallas con estilo material.
              MaterialPageRoute(builder: (context) => Login()),
              //MaterialPageRoute(builder: (context) => Dashboard()),
            );
          },
        ),
      ],
    );
  }
}

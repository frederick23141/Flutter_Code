import 'package:flutter/material.dart';

class MenuOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //agregar icono de usuario y nombre del asesor
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.person), Text("Asesor con ingreso")],
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Central'),
          onTap: () {
            // Acción para Inicio
          },
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Novedades'),
          onTap: () {
            // Acción para Configuración
          },
        ),
        ListTile(
          leading: Icon(Icons.route),
          title: Text('Rutas'),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.calendar_month),
          title: Text('Agenda'),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.category_sharp),
          title: Text('Catalogo'),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: Text('Buscar'),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.document_scanner),
          title: Text('Cotizacion'),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.pie_chart),
          title: Text('Estadisticas'),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('Consignaciones'),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.cloud_download),
          title: Text('Cierre de rutas'),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Configuración'),
          onTap: () {
            // Acción para Acerca de
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Cerrar sesión'),
          onTap: () {
            // Acción para Acerca de
          },
        ),
      ],
    );
  }
}

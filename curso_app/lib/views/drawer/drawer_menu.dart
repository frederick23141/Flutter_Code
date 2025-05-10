import 'package:curso_app/core/constants/app_images.dart';
import 'package:curso_app/core/routes/app_routes.dart';
import 'package:curso_app/login.dart';
import 'package:curso_app/pages/routelist.dart';
import 'package:curso_app/pages/userlist.dart';
import 'package:curso_app/pages/cartera.dart';
import 'package:curso_app/pages/gifpage.dart';
import 'package:curso_app/pages/carrusel.dart';
import 'package:flutter/material.dart';
import 'package:curso_app/views/client/client_page.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          //agregar icono de usuario y nombre del asesor
          SizedBox(
            //color: AppColors.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      //icon size change to more size,
                      image: AssetImage(AppImages.logo),
                    ),
                  ),
                ),
                Text("@Commernet.user", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Central', style: TextStyle(fontSize: 14.0)),
            onTap: () {
              // Acción para Inicio, crear la ruta, su ccase y llamarlo desde esta pantalla
              Navigator.pushNamed(context, AppRoutes.client);
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
            title: Text('_Clientes', style: TextStyle(fontSize: 14.0)),
            onTap: () {
              // Acción para Acerca de
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClientPage()),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Carrusel()),
              );
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
      ),
    );
  }
}

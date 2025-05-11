import 'package:curso_app/core/constants/app_images.dart';
import 'package:curso_app/core/constants/constants.dart';
import 'package:curso_app/core/routes/app_routes.dart';
import 'package:curso_app/login.dart';
import 'package:curso_app/pages/routelist.dart';
import 'package:curso_app/pages/cartera.dart';
import 'package:curso_app/pages/gifpage.dart';
import 'package:curso_app/pages/carrusel.dart';
import 'package:flutter/material.dart';
import 'package:curso_app/views/client/client_page.dart';
import 'package:flutter/cupertino.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundCard,
      child: SafeArea(
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
                ],
              ),
            ),
            Divider(),

            ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text('Central', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                Navigator.pop(context);
                // Acción para Inicio, crear la ruta, su ccase y llamarlo desde esta pantalla
                Navigator.pushNamed(context, AppRoutes.homescreen);
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.captions_bubble),
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
              leading: Icon(CupertinoIcons.rectangle_stack_person_crop),

              title: Text('Clientes', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.map_pin_ellipse),

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
              leading: Icon(CupertinoIcons.calendar),

              title: Text('Agenda', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.book),

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
              leading: Icon(CupertinoIcons.search),

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
              leading: Icon(CupertinoIcons.doc_person),

              title: Text('Cotizacion', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.chart_bar_square),

              title: Text('Estadisticas', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.money_dollar_circle),
              title: Text('Consignaciones', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.paperplane),

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
      ),
    );
  }
}

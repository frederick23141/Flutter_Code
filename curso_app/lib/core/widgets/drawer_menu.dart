import 'package:curso_app/core/constants/app_images.dart';
import 'package:curso_app/core/constants/constants.dart';
import 'package:curso_app/core/routes/app_routes.dart';
import 'package:curso_app/pages/routelist.dart';
import 'package:curso_app/pages/cartera.dart';
import 'package:curso_app/pages/gifpage.dart';
import 'package:curso_app/pages/carrusel.dart';
import 'package:curso_app/views/home/home_page.dart';
import 'package:curso_app/views/home/home_page_screen.dart';
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
              leading: Icon(
                CupertinoIcons.home,
                color: AppColors.buttonPressed,
              ),
              title: Text('Central', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.captions_bubble,
                color: AppColors.buttonPressed,
              ),
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
              leading: Icon(
                CupertinoIcons.rectangle_stack_person_crop,
                color: AppColors.buttonPressed,
              ),

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
              leading: Icon(
                CupertinoIcons.map_pin_ellipse,
                color: AppColors.buttonPressed,
              ),

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
              leading: Icon(
                CupertinoIcons.calendar,
                color: AppColors.buttonPressed,
              ),

              title: Text('Agenda', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.book,
                color: AppColors.buttonPressed,
              ),

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
              leading: Icon(
                CupertinoIcons.search,
                color: AppColors.buttonPressed,
              ),

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
              leading: Icon(
                CupertinoIcons.doc_person,
                color: AppColors.buttonPressed,
              ),

              title: Text('Cotizacion', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.chart_bar_square,
                color: AppColors.buttonPressed,
              ),

              title: Text('Estadisticas', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.money_dollar_circle,
                color: AppColors.buttonPressed,
              ),
              title: Text('Consignaciones', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.paperplane,
                color: AppColors.buttonPressed,
              ),

              title: Text('Cierre de rutas', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
              },
            ),

            ListTile(
              leading: Icon(Icons.settings, color: AppColors.buttonPressed),
              title: Text('Configuración', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: AppColors.error),
              title: Text('Cerrar sesión', style: TextStyle(fontSize: 14.0)),
              onTap: () {
                // Acción para Acerca de
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.login_screen);
              },
            ),
          ],
        ),
      ),
    );
  }
}

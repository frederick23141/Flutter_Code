import 'package:flutter/material.dart';
import 'package:curso_app/pages/components/navmenu.dart';
import 'package:curso_app/pages/components/bottonmenu.dart';
import 'package:curso_app/views/drawer/drawer_menu.dart';

class HomePageCentral extends StatefulWidget {
  const HomePageCentral({super.key});

  @override
  State<HomePageCentral> createState() => _HomePageCentralState();
}

class _HomePageCentralState extends State<HomePageCentral> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(title: Text("Gestión movil")),
        drawer: Drawer(
          child: DrawerMenu(),
          //   // Aquí insertas el widget personalizado
        ),
        body: Center(child: Text("_home page")),
        bottomNavigationBar: BottonMenu(
          selectedIndex: _selectedIndex,
          onItemTapped: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

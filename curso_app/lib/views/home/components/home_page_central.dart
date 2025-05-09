import 'package:flutter/material.dart';
import 'package:curso_app/pages/components/navmenu.dart';
import 'package:curso_app/pages/components/bottonmenu.dart';

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
          child: MenuOpciones(),
          // Aquí insertas el widget personalizado
        ),
        body: Center(child: Text("usuario registrado")),
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

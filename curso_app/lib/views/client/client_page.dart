import 'package:curso_app/pages/components/navmenu.dart';
import 'package:curso_app/views/client/components/card_client.dart';
import 'package:curso_app/views/client/components/client_page_form.dart';
import 'package:flutter/material.dart';
import 'package:curso_app/views/drawer/drawer_menu.dart';
import 'package:curso_app/views/client/components/client_header.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientState();
}

class _ClientState extends State<ClientPage> {
  String filtro = "";

  void actualizarFiltro(String nuevoFiltro) {
    setState(() {
      filtro =
          nuevoFiltro.toLowerCase(); // convierte a minúsculas para comparación
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clientes")),
      drawer: Drawer(child: DrawerMenu()),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClientHeader(onChanged: actualizarFiltro),

              Expanded(child: ClientPageForm(filtro: filtro)),
              //LoginPageForm(),
              // SizedBox(height: AppDefaults.padding),
              // DontHaveAccountRow(),
            ],
          ),
        ),
      ),
    );
  }
}

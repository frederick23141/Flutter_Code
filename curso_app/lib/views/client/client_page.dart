import 'package:curso_app/core/constants/app_colors.dart';
import 'package:curso_app/core/constants/app_defaults.dart';
import 'package:curso_app/views/client/components/card_client.dart';
import 'package:curso_app/views/client/components/client_page_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curso_app/core/widgets/drawer_menu.dart';
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
      appBar: AppBar(
        //title: Text("Clientes"),
        title: TextField(
          onChanged: actualizarFiltro,
          decoration: InputDecoration(
            hintText: 'Buscar cliente...',
            border: InputBorder.none,
            prefixIcon: Icon(CupertinoIcons.search),
            fillColor: AppColors.backgroundAlt,
            filled: true,
          ),
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: AppColors.backgroundAlt,
      ),
      drawer: Drawer(child: DrawerMenu()),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: AppDefaults.margin),
              //se crea el buscar en esta misma pagina en el encabezado, ya no es necesario enviar el header
              //ClientHeader(onChanged: actualizarFiltro),
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

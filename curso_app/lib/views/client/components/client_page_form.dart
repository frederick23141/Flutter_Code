import 'package:curso_app/core/controllers/client/client_controller.dart';
import 'package:curso_app/core/models/client.dart';
import 'package:curso_app/views/client/components/card_client.dart';
import 'package:curso_app/views/route/components/card_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClientPageForm extends StatelessWidget {
  final String filtro;

  const ClientPageForm({super.key, required this.filtro});

  @override
  Widget build(BuildContext context) {
    // * CARGAMOS LAS EMPRESAS DEL INICIO DE SECION, PARA TRABAJAR EN LOCAL
    final List<Client> empresas = EmpresaController().empresas;

    final List<Client> empresasFiltradas =
        empresas.where((empresa) {
          return empresa.nombre.toLowerCase().contains(filtro.toLowerCase());
        }).toList();

    return ListView.builder(
      itemCount: empresasFiltradas.length,
      itemBuilder: (context, index) {
        final empresa = empresasFiltradas[index];
        return CardClient(
          nombre: empresa.nombre,
          nit: empresa.nit,
          tipoCliente: empresa.tipoCliente,
          direccion: empresa.direccion,
          ciudad: empresa.ciudad,
          referencia: 'N',
          onTap: () {
            print('Cliente capturado: ${empresa.nombre}');
          },
        );

        //esta linea de card route es para probar el card. el real es el de cliente
        /*return CardRoute(
          nombre: empresa.nombre,
          clientes: 3,
          visitados: 2,
          ventas: 1,
          ciudad: empresa.ciudad,
          referencia: 'N',
        );
        */
      },
    );
  }
}

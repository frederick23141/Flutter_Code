import 'package:curso_app/core/controllers/client_controller.dart';
import 'package:curso_app/core/models/client.dart';
import 'package:curso_app/views/client/components/card_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClientPageForm extends StatelessWidget {
  final String filtro;

  const ClientPageForm({super.key, required this.filtro});

  @override
  Widget build(BuildContext context) {
    //test delete
    final List<Client> empresas = EmpresaController().empresas;

    final List<Client> empresasFiltradas =
        empresas.where((empresa) {
          return empresa.nombre.toLowerCase().contains(filtro.toLowerCase());
        }).toList();
    //end test

    /*final List<CardClient> empresasFiltradas =
        empresas.where((empresa) {
          return empresa.nombre.toLowerCase().contains(filtro);
        }).toList();
*/
    return ListView.builder(
      itemCount: empresasFiltradas.length,
      itemBuilder: (context, index) {
        final empresa = empresasFiltradas[index];
        return CardClient(
          nombre: empresa.nombre,
          nit: empresa.nit,
          tipoCliente: empresa.tipoCliente,
          direccion: empresa.direccion,
        );
      },
    );
  }
}

// class ClientPageForm extends StatelessWidget {
//   final String filtro;

//   const ClientPageForm({super.key, required this.filtro});

//   @override
//   Widget build(BuildContext context) {
//     final empresaController = EmpresaController(); // Accede al singleton
//     final empresas = empresaController.empresas;

//     final empresasFiltradas =
//         empresas.where((empresa) {
//           return empresa.nombre.toLowerCase().contains(filtro.toLowerCase());
//         }).toList();

//     return ListView.builder(
//       itemCount: empresasFiltradas.length,
//       itemBuilder: (context, index) {
//         final empresa = empresasFiltradas[index];
//         return CardClient(
//           nombre: empresa.nombre,
//           nit: empresa.nit,
//           tipoCliente: empresa.tipoCliente,
//           direccion: empresa.direccion,
//         );
//       },
//     );
//   }
// }

final List<CardClient> empresas = [
  CardClient(
    nombre: 'Cartago A',
    nit: 'NIT-0001',
    tipoCliente: 'Activo',
    direccion: 'Cra 1 #12-1',
  ),
  CardClient(
    nombre: 'Botero B',
    nit: 'NIT-0002',
    tipoCliente: 'Inactivo',
    direccion: 'Cra 2 #13-1',
  ),
  CardClient(
    nombre: 'Halte C',
    nit: 'NIT-0003',
    tipoCliente: 'Activo',
    direccion: 'Cra 3 #14-1',
  ),
  CardClient(
    nombre: 'Bex D',
    nit: 'NIT-0004',
    tipoCliente: 'Inactivo',
    direccion: 'Cra 4 #15-1',
  ),
  CardClient(
    nombre: 'Corta E',
    nit: 'NIT-0005',
    tipoCliente: 'Activo',
    direccion: 'Cra 5 #16-1',
  ),
  CardClient(
    nombre: 'Celt F',
    nit: 'NIT-0006',
    tipoCliente: 'Inactivo',
    direccion: 'Cra 6 #17-1',
  ),
  CardClient(
    nombre: 'Dant G',
    nit: 'NIT-0007',
    tipoCliente: 'Activo',
    direccion: 'Cra 7 #18-1',
  ),
  CardClient(
    nombre: 'Pert H',
    nit: 'NIT-0008',
    tipoCliente: 'Inactivo',
    direccion: 'Cra 8 #19-1',
  ),
  CardClient(
    nombre: 'Kuma I',
    nit: 'NIT-0009',
    tipoCliente: 'Activo',
    direccion: 'Cra 9 #20-1',
  ),
  CardClient(
    nombre: 'Laoh J',
    nit: 'NIT-0010',
    tipoCliente: 'Inactivo',
    direccion: 'Cra 10 #21-1',
  ),
  CardClient(
    nombre: 'Liet K',
    nit: 'NIT-0011',
    tipoCliente: 'Activo',
    direccion: 'Cra 11 #22-1',
  ),
  CardClient(
    nombre: 'Carws L',
    nit: 'NIT-0012',
    tipoCliente: 'Inactivo',
    direccion: 'Cra 12 #23-1',
  ),
  CardClient(
    nombre: 'Gem M',
    nit: 'NIT-0013',
    tipoCliente: 'Activo',
    direccion: 'Cra 13 #24-1',
  ),
  CardClient(
    nombre: 'Gear N',
    nit: 'NIT-0014',
    tipoCliente: 'Inactivo',
    direccion: 'Cra 14 #25-1',
  ),
  CardClient(
    nombre: 'Tion O',
    nit: 'NIT-0015',
    tipoCliente: 'Activo',
    direccion: 'Cra 15 #26-1',
  ),
  CardClient(
    nombre: 'Qea P',
    nit: 'NIT-0016',
    tipoCliente: 'Inactivo',
    direccion: 'Cra 16 #27-1',
  ),
  CardClient(
    nombre: 'Ret Q',
    nit: 'NIT-0017',
    tipoCliente: 'Activo',
    direccion: 'Cra 17 #28-1',
  ),
  CardClient(
    nombre: 'Fet R',
    nit: 'NIT-0018',
    tipoCliente: 'Inactivo',
    direccion: 'Cra 18 #29-1',
  ),
  CardClient(
    nombre: 'Dev S',
    nit: 'NIT-0019',
    tipoCliente: 'Activo',
    direccion: 'Cra 19 #30-1',
  ),
  CardClient(
    nombre: 'Vic T',
    nit: 'NIT-0020',
    tipoCliente: 'Inactivo',
    direccion: 'Cra 20 #31-1',
  ),
];

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_app/core/models/client.dart';
import 'package:curso_app/core/repositories/client/i_client_repository.dart';

class ClientRepository implements IClientRepository {
  @override
  Future<List<Client>> getEmpresas() async {
    List<Client> empresas = [];

    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('empresas').get();

      empresas =
          snapshot.docs.map((doc) {
            final data = doc.data();
            return Client(
              id: doc.id,
              nombre: data['nombre'] ?? '',
              nit: data['nit'] ?? '',
              tipoCliente: data['tipoCliente'] ?? '',
              direccion: data['direccion'] ?? '',
              telefono: data['telefono'] ?? '',
              email: data['email'] ?? '',
              ciudad: data['ciudad'] ?? '',
              zona: data['zona'] ?? '',
            );
          }).toList();
    } catch (e) {
      print('Error al obtener empresas: $e');
    }

    return empresas;
  }
}

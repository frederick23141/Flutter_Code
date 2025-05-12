import 'package:curso_app/core/models/client.dart';
import 'package:curso_app/core/repositories/client/i_client_repository.dart';
import 'package:curso_app/core/repositories/client/client_repository.dart';

class EmpresaController {
  // --- Singleton setup ---
  static final EmpresaController _instance = EmpresaController._internal();
  factory EmpresaController() => _instance;
  EmpresaController._internal();

  // --- Repositorio y datos ---
  final IClientRepository _repository = ClientRepository();

  List<Client> _empresas = [];

  List<Client> get empresas => _empresas;

  Future<void> cargarEmpresas() async {
    _empresas = await _repository.getEmpresas();
  }

  // Client? getEmpresaPorId(String id) {
  //   return _empresas.firstWhere((e) => e.id == id, orElse: () => null);
  // }
}

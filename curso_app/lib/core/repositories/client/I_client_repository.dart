import 'package:curso_app/core/models/client.dart';

abstract class IClientRepository {
  Future<List<Client>> getEmpresas();
}

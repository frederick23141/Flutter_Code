import 'package:curso_app/core/models/route.dart';
import 'package:curso_app/core/repositories/route/i_route_repository.dart';
import 'package:curso_app/core/repositories/route/route_repository.dart';

class RouteController {
  // --- Singleton setup ---
  static final RouteController _instancce = RouteController._internal();
  factory RouteController() => _instancce;
  RouteController._internal();

  // ----- Repositorio y datos --
  final IRouteRepository _repository = RouteRepository();

  List<RouteModel> _routes = [];

  List<RouteModel> get routes => _routes;

  Future<void> cargarRutas() async {
    _routes = await _repository.getRoutes();
  }
}

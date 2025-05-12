import 'package:curso_app/core/models/route.dart';

abstract class IRouteRepository {
  Future<List<RouteModel>> getRoutes();
}

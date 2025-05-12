import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_app/core/models/route.dart';
import 'package:curso_app/core/repositories/route/i_route_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

class RouteRepository implements IRouteRepository {
  @override
  Future<List<RouteModel>> getRoutes() async {
    List<RouteModel> rutas = [];

    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('empresas').get();

      rutas =
          snapshot.docs.map((doc) {
            final data = doc.data();
            return RouteModel(
              id: doc.id,
              nombre: data['nombre'] ?? '',
              descripcion: data['descripcion'] ?? '',
              fechaCreacion: data['fechaCreacion'] ?? '',
              vendedorId: data['vendedorId'] ?? '',
            );
          }).toList();
    } catch (e) {
      print('Error al obtener empresas: $e');
    }
    return rutas;
  }
}

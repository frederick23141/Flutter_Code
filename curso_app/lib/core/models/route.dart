class RouteModel {
  final String id;
  final String nombre;

  final String descripcion;
  //final String clientesAsignados;
  final String vendedorId;
  final String fechaCreacion;

  RouteModel({
    required this.id,
    required this.nombre,

    required this.descripcion,
    //required this.clientesAsignados,
    required this.vendedorId,
    required this.fechaCreacion,
  });
}

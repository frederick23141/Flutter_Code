class Route {
  final String id;
  final String nombre;
  final String descripcion;
  final List<String> clientesAsignados;
  final String vendedorId;
  final DateTime fechaCreacion;

  Route({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.clientesAsignados,
    required this.vendedorId,
    required this.fechaCreacion,
  });
}

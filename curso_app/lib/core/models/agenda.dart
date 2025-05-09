class Agenda {
  final String id;
  final String clienteId;
  final String vendedorId;
  final String tipoActividad;
  final String descripcion;
  final DateTime fecha;
  final String estado;

  Agenda({
    required this.id,
    required this.clienteId,
    required this.vendedorId,
    required this.tipoActividad,
    required this.descripcion,
    required this.fecha,
    required this.estado,
  });
}

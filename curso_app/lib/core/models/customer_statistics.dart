class CustomerStatistics {
  final String clienteId;
  final int totalPedidos;
  final double totalComprado;
  final double promedioMensual;
  final DateTime ultimaCompra;

  CustomerStatistics({
    required this.clienteId,
    required this.totalPedidos,
    required this.totalComprado,
    required this.promedioMensual,
    required this.ultimaCompra,
  });
}

class WalletDet {
  final String id;
  final String carteraEncabezadoId;
  final String documento;
  final double valor;
  final DateTime fechaEmision;
  final DateTime fechaVencimiento;
  final double saldo;
  final String estado;

  WalletDet({
    required this.id,
    required this.carteraEncabezadoId,
    required this.documento,
    required this.valor,
    required this.fechaEmision,
    required this.fechaVencimiento,
    required this.saldo,
    required this.estado,
  });
}

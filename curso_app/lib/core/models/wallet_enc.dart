class WalletEnc {
  final String id;
  final String clienteId;
  final double saldoTotal;
  final DateTime fechaCorte;
  final int documentosPendientes;

  WalletEnc({
    required this.id,
    required this.clienteId,
    required this.saldoTotal,
    required this.fechaCorte,
    required this.documentosPendientes,
  });
}

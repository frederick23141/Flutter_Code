class Product {
  final String id;
  final String nombre;
  final String descripcion;
  final double precio;
  final int stock;
  final String categoria;
  final String imagenUrl;
  final bool activo;

  Product({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.stock,
    required this.categoria,
    required this.imagenUrl,
    required this.activo,
  });
}

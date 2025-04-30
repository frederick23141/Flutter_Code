import 'package:flutter/material.dart';

class EmpresaCard extends StatelessWidget {
  final String nombre;
  final String nit;
  final String estado;

  const EmpresaCard({
    super.key,
    required this.nombre,
    required this.nit,
    required this.estado,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8), // Espaciado exterior
      child: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(6), // Espaciado interno del card
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.business, size: 45, color: Colors.deepOrangeAccent),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'NIT: $nit',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Estado: $estado',
                      style: TextStyle(fontSize: 12, color: Colors.green),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.phone, size: 40, color: Colors.green),
                onPressed: () {
                  // Acción al presionar teléfono
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

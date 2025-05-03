import 'package:flutter/material.dart';

class EmpresaCard extends StatelessWidget {
  final String nombre;
  final String nit;
  final String estado;
  final String direccion;

  const EmpresaCard({
    super.key,
    required this.nombre,
    required this.nit,
    required this.estado,
    required this.direccion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ), // Espaciado exterior
      child: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(6), // Espaciado interno del card
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Text(nombre[0], style: TextStyle(fontSize: 18)),
              ),
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
                    SizedBox(height: 3),
                    Text(
                      'NIT: $nit',
                      style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Dirección: $direccion',
                      style: TextStyle(fontSize: 11, color: Colors.black),
                    ),
                    SizedBox(height: 2),
                  ],
                ),
              ),
              Text(
                '$estado',
                style: TextStyle(
                  fontSize: 10,
                  color: '$estado' == 'Activo' ? Colors.green : Colors.red,
                ),
              ),
              /* IconButton(
                icon: Icon(Icons.phone, size: 35, color: Colors.green),
                onPressed: () {
                  // Acción al presionar teléfono
                },
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardRoute extends StatelessWidget {
  final String ruta;
  final int clientes;
  final int visitados;
  final int efectivos;

  const CardRoute({
    super.key,
    required this.ruta,
    required this.clientes,
    required this.visitados,
    required this.efectivos,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 0,
      ), // Espaciado exterior
      child: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(6), // Espaciado interno del card
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.route, size: 45, color: Colors.deepOrangeAccent),
              SizedBox(width: 20),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        ruta,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Clientes: $clientes',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),

                        Text(
                          ' - Visitado: $visitados',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

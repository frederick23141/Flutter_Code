import 'package:flutter/material.dart';

class carteracomponent extends StatelessWidget {
  final String ruta;
  final int clientes;
  final int visitados;
  final int efectivos;

  const carteracomponent({
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
          padding: EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Espacio entre columnas
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Alinea textos al inicio
                    children: [
                      Text(
                        "Juan david Toro - Fulcet",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        "89121321",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "carrera 13 # 13-33",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end, // Alinea textos al final
                    children: [
                      Text(
                        "Cop 190.222",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      Text("telefono 312021231"),
                      Text("dias -3"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

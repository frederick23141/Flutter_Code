import 'package:flutter/material.dart';

class carteradetallecomponent extends StatelessWidget {
  final String ruta;
  final int clientes;
  final int visitados;
  final int efectivos;

  const carteradetallecomponent({
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
              //al inicio, diseño unico
              Text("908352171-1   Razón social   -  razón comercial"),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Espacio entre columnas
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Alinea textos al inicio
                    children: [
                      Text(
                        "Vence: 150.000",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        "Dias: -5",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Notas:",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end, // Alinea textos al final
                    children: [
                      Text(
                        "Aplicado: 150.000",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      Text("Saldo: 0.0"),
                      Text("Total: 0.0"),
                    ],
                  ),
                ],
              ),
              Text(
                "Realizar entrega en sucursal 10 en dias martes a jueves",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

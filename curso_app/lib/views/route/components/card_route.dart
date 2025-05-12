import 'package:curso_app/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardRoute extends StatelessWidget {
  final String nombre;
  final int clientes;
  final int visitados;
  final int ventas;
  final String ciudad;
  final String referencia;

  const CardRoute({
    super.key,
    required this.nombre,
    required this.clientes,
    required this.visitados,
    required this.ventas,
    required this.ciudad,
    required this.referencia,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8), // Espaciado exterior
      child: Card(
        color: AppColors.backgroundCard,
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(6), // Espaciado interno del card
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [Icon(CupertinoIcons.map_pin, size: 30)]),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 3),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Clientes: $clientes',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          'Visitados: $visitados',
                          style: TextStyle(
                            fontSize: 12,
                            // color: estado == 'Activo' ? Colors.green : Colors.red,
                          ),
                        ),
                        Text(
                          'Ventas: $ventas',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(width: 4),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    'Cobertura: 50%',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Efectividad: 50%',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textPrimary,
                    ),
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

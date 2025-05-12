import 'package:curso_app/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardClient extends StatelessWidget {
  final String nombre;
  final String nit;
  final String tipoCliente;
  final String direccion;
  final String ciudad;
  final String referencia;
  final VoidCallback? onTap;

  const CardClient({
    super.key,
    required this.nombre,
    required this.nit,
    required this.tipoCliente,
    required this.direccion,
    required this.ciudad,
    required this.referencia,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: AppColors.backgroundCard,
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.all(6), // Espaciado interno del card
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Text(
                    nombre[0],
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  backgroundColor: AppColors.buttonPrimary,
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
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'NIT: $nit',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            '$ciudad - ',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Dirección: $direccion',
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
                Text(
                  tipoCliente,
                  style: TextStyle(
                    fontSize: 10,
                    // color: estado == 'Activo' ? Colors.green : Colors.red,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.location_solid,
                    size: 35,
                    color: referencia == 'S' ? Colors.green : Colors.grey,
                  ),
                  onPressed: () {
                    // Acción al presionar teléfono
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

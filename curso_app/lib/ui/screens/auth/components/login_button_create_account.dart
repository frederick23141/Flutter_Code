import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_app/core/constants/app_colors.dart';
import 'package:curso_app/data/datasources/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LoginButtonCreateAccount extends StatelessWidget {
  const LoginButtonCreateAccount({super.key});

  Future<void> _syncUsersFromFirestore(BuildContext context) async {
    final dbHelper = DatabaseHelper();

    try {
      // Inicializar DB (crear tablas si no existen)
      await dbHelper.database;

      // Obtener usuarios de Firestore
      final snapshot =
          await FirebaseFirestore.instance.collection('users').get();

      // Guardar usuarios en SQLite
      for (var doc in snapshot.docs) {
        final data = doc.data();
        await dbHelper.insertOrUpdateUser({
          'id': doc.id,
          'job': data['job'],
          'name': data['name'],
          'password': data['password'], // Mejor cifrar en producción
        });
      }

      // Mostrar mensaje éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuarios sincronizados correctamente')),
      );
    } catch (e) {
      print('Error al sincronizar: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al sincronizar: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(child: Divider(color: AppColors.border)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "o",
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
              Expanded(child: Divider(color: AppColors.border)),
            ],
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.buttonPrimary,
              minimumSize: Size(350, 50),
              side: const BorderSide(color: AppColors.buttonPrimary),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => _syncUsersFromFirestore(context),
            child: const Text(
              'Crear cuenta',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

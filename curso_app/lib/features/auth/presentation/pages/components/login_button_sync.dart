import 'dart:developer';
import 'package:curso_app/core/constants/app_colors.dart';
import 'package:curso_app/features/auth/domain/usecases/sync_users_from_firestore.dart';
import 'package:curso_app/injection/injection_container.dart';
import 'package:flutter/material.dart';

class LoginButtonSync extends StatelessWidget {
  const LoginButtonSync({super.key});

  Future<void> _syncUsersFromFirestore(BuildContext context) async {
    final syncUseCase = getIt<SyncUsersFromFirestore>();
    try {
      await syncUseCase();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuarios sincronizados de manera correcta'),
        ),
      );
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al sincronizar los usuarios: ${e.toString()}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            'Sincronizar',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

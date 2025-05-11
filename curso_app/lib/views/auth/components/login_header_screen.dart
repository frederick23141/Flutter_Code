import 'package:flutter/cupertino.dart';
import 'package:curso_app/core/constants/app_colors.dart';
import 'package:curso_app/core/constants/app_images.dart';

class LoginHeaderScreen extends StatelessWidget {
  const LoginHeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.logo),
        const SizedBox(height: 8),
        const Text(
          'Asesores Comerciales',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

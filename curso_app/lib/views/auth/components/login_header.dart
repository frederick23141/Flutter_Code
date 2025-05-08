import 'package:curso_app/core/components/network_image.dart';
import 'package:curso_app/core/constants/app_images.dart';
import 'package:curso_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPageHeader extends StatelessWidget {
  const LoginPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: const AspectRatio(
            aspectRatio: 2 / 2,
            child: NetworkImageWithLoader(AppImages.logo),
          ),
        ),
        // Text(
        //   "Eaa app",
        //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
        //     fontWeight: FontWeight.bold,
        //     color: AppColors.primary,
        //   ),
        // ),
      ],
    );
  }
}

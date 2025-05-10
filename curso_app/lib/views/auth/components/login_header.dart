import 'package:curso_app/core/components/network_image.dart';
import 'package:curso_app/core/constants/app_images.dart';
import 'package:curso_app/core/constants/app_colors.dart';
import 'package:curso_app/core/constants/constants.dart';
import 'package:curso_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPageHeader extends StatelessWidget {
  const LoginPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => goSetrings(context),
              icon: SvgPicture.asset(AppIcons.user, color: AppColors.primary),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            //child: NetworkImageWithLoader(AppImages.logo),
            child: Image.asset(AppImages.logo),
          ),
        ),
      ],
    );
  }

  void goSetrings(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.setings);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../views/auth/login_page.dart';

import 'app_routes.dart';
import 'unknown_page.dart';

class RouteGenerator {
  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;

    switch (route) {
      case AppRoutes.login:
        return CupertinoPageRoute(builder: (_) => const LoginPage());

      // case AppRoutes.signup:
      //   return CupertinoPageRoute(builder: (_) => const SignUpPage());

      // case AppRoutes.termsAndConditions:
      //   return CupertinoPageRoute(
      //     builder: (_) => const TermsAndConditionsPage(),
      //   );

      default:
        return errorRoute();
    }
  }

  static Route? errorRoute() =>
      CupertinoPageRoute(builder: (_) => const UnknownPage());
}

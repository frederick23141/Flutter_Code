import 'package:curso_app/views/Settings/setings_data.dart';
import 'package:curso_app/views/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curso_app/views/client/client_page.dart';
import 'package:curso_app/views/auth/login_screen.dart';
import 'package:curso_app/views/home/home_page_screen.dart';

import '../../views/auth/login_page.dart';

import 'app_routes.dart';
import 'unknown_page.dart';

class RouteGenerator {
  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;

    switch (route) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case AppRoutes.client:
        return MaterialPageRoute(builder: (context) => const ClientPage());

      case AppRoutes.setings:
        return MaterialPageRoute(builder: (_) => const SetingsData());

      case AppRoutes.login_screen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.homescreen:
        return MaterialPageRoute(builder: (_) => const HomePageScreen());

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

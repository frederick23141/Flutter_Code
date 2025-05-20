import 'package:curso_app/features/auth/presentation/pages/login_screen.dart';
import 'package:curso_app/views/Settings/setings_data.dart';
import 'package:curso_app/views/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curso_app/views/client/client_page.dart';
import 'package:curso_app/views/home/home_page_screen.dart';

import 'app_routes.dart';
import 'unknown_page.dart';

class RouteGenerator {
  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;

    switch (route) {
      case AppRoutes.client:
        return MaterialPageRoute(builder: (context) => const ClientPage());

      case AppRoutes.setings:
        return MaterialPageRoute(builder: (_) => const SetingsData());

      case AppRoutes.login_screen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.homescreen:
        return MaterialPageRoute(builder: (_) => const HomePageScreen());

      default:
        return errorRoute();
    }
  }

  static Route? errorRoute() =>
      CupertinoPageRoute(builder: (_) => const UnknownPage());
}

import 'package:curso_app/core/routes/app_routes.dart';
import 'package:curso_app/core/routes/on_generate_route.dart';
import 'package:curso_app/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app name',
      theme: AppTheme.defaultTheme,
      onGenerateRoute: RouteGenerator.onGenerate,
      initialRoute: AppRoutes.login,
    );
  }
}

import 'package:curso_app/core/constants/app_defaults.dart';
import 'package:curso_app/core/themes/app_themes.dart';
import 'package:curso_app/core/utils/validators.dart';
import 'package:curso_app/views/auth/components/login_header.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginPageHeader(),
                // LoginPageForm(),
                SizedBox(height: AppDefaults.padding),
                // DontHaveAccountRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

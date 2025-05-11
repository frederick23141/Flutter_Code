import 'package:curso_app/core/constants/app_defaults.dart';
import 'package:curso_app/core/themes/app_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curso_app/core/constants/app_colors.dart';
import 'package:curso_app/core/routes/app_routes.dart';
import 'package:curso_app/views/auth/components/login_button_screen.dart';
import 'package:curso_app/views/home/home_page_screen.dart';

class LoginPageFormScreen extends StatefulWidget {
  const LoginPageFormScreen({super.key});

  @override
  State<LoginPageFormScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPageFormScreen> {
  final _key = GlobalKey<FormState>();

  //metodo para determinar se se clickeo el mostrar contrase;a
  bool isPasswordShown = false;
  onPawssShowClicked() {
    isPasswordShown = !isPasswordShown;
    setState(() {});
  }

  onLogin() {
    final bool isFormOkey = _key.currentState?.validate() ?? false;
    if (isFormOkey) {
      //vamos a la proxima pesta;a o pagina
      Navigator.pushNamed(context, AppRoutes.home);
    } else {
      //funcional
      Navigator.pushNamed(context, AppRoutes.home);
      //dise;o de app moderna
      Navigator.pushNamed(context, AppRoutes.homescreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.defaultTheme.copyWith(
        inputDecorationTheme: AppTheme.defaultInputDecorationTheme,
      ),
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Form(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Correo electrónico',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                onFieldSubmitted: (value) => onLogin(),
                textInputAction: TextInputAction.done,
                obscureText: !isPasswordShown,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  //suffixIcon: Icon(Icons.visibility_outlined),
                  suffixIcon: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: onPawssShowClicked,
                      icon: Icon(Icons.visibility_outlined),
                    ),
                  ),
                  hintText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      color: AppColors.buttonPrimary,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              LoginButtonScreen(onPressed: onLogin),
            ],
          ),
        ),
      ),
    );
  }
}

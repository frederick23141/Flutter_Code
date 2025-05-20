import 'package:curso_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:curso_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:curso_app/core/constants/app_defaults.dart';
import 'package:curso_app/core/themes/app_themes.dart';
import 'package:curso_app/features/auth/presentation/pages/components/login_button_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curso_app/core/constants/app_colors.dart';
import 'package:curso_app/core/routes/app_routes.dart';

import 'package:curso_app/views/home/home_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageFormScreen extends StatefulWidget {
  const LoginPageFormScreen({super.key});

  @override
  State<LoginPageFormScreen> createState() => _LoginPageFormScreen();
}

class _LoginPageFormScreen extends State<LoginPageFormScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // final _key = GlobalKey<FormState>();

  //metodo para determinar se se clickeo el mostrar contrase;a
  bool isPasswordShown = false;
  onPawssShowClicked() {
    isPasswordShown = !isPasswordShown;
    setState(() {});
  }

  void _onLoginPressed() {
    print("Botón presionado");
    final _username = _usernameController.text.trim();
    final _password = _passwordController.text.trim();

    if (_username.isEmpty || _password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor completa todos los campos")),
      );
      return;
    }
    context.read<AuthBloc>().add(
      LoginRequested(username: _username, password: _password),
    );
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
              TextField(
                controller: _usernameController,
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
                controller: _passwordController,
                //onFieldSubmitted: (value) => onLogin(),
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
              //LoginButtonScreen(onPressed: onLogin),
              LoginButtonScreen(onPressed: _onLoginPressed),
            ],
          ),
        ),
      ),
    );
  }
}

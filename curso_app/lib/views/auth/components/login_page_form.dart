import 'package:curso_app/core/constants/constants.dart';
import 'package:curso_app/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curso_app/views/auth/components/login_button.dart';

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({super.key});

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
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
      //Navigator.pushNamed(context, AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.defaultTheme.copyWith(
        inputDecorationTheme: AppTheme.defaultInputDecorationTheme,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Numero de telefono"),
              const SizedBox(height: 8),
              //telefono
              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: AppDefaults.padding),
              //pasword
              const Text("Contrasenha"),
              const SizedBox(height: 8),
              TextFormField(
                onFieldSubmitted: (value) => onLogin(),
                textInputAction: TextInputAction.done,
                obscureText: !isPasswordShown,
                decoration: InputDecoration(
                  suffixIcon: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: onPawssShowClicked,
                      icon: SvgPicture.asset(AppIcons.eye, width: 24),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDefaults.padding),

              //button login
              LoginButton(onPressed: onLogin),
            ],
          ),
        ),
      ),
    );
  }
}

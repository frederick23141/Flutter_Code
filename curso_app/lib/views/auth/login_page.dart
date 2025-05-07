import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("app style dessing"),
                  SizedBox(height: 80),
                  TextField(decoration: InputDecoration(hintText: "Usuario.")),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(hintText: "Contraseña"),
                    obscureText: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

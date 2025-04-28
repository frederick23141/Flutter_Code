import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(
                "Terminos y condiciones",
                //estos estilos pueden estar en una clase de configuracion aparte. titulos, subtitulos, etc.
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              //separador entre widgets con un tamaño de 20
              SizedBox(height: 20),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  //el color del texto es blanco
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Aceptar todo"), Icon(Icons.arrow_forward)],
                ),

                onPressed: () {
                  //metodo para regresar a la pantalla anterior
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

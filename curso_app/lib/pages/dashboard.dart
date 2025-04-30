import 'package:flutter/material.dart';

//variable de estado para manipular el alertdilog, variables goblales fuera de la clase.
bool _estadoTerminos = false;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
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
                  showDialog(
                    //el barrierDismissible es un booleano que indica si se puede cerrar la alerta al tocar fuera de ella
                    barrierDismissible: false,
                    context: context,
                    builder:
                        (_) => new AlertDialog(
                          title: Text(
                            _estadoTerminos
                                ? "Cancelar Terminos"
                                : "Aceptar Terminos",
                          ),
                          content: Text(
                            "Estas seguro de aceptar los terminos y condiciones?",
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                //para usar setstate debe crearse el extends de la clase
                                setState(() {
                                  _estadoTerminos = !_estadoTerminos;
                                });
                                //cambia el estado de la variable global

                                Navigator.pop(context);
                              },
                              child: Text("Aceptar"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _estadoTerminos = false;
                                setState(() {});
                                //metodo para regresar a la pantalla anterior
                                Navigator.pop(context);
                              },
                              child: Text("Cancelar"),
                            ),
                          ],
                        ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                _estadoTerminos
                    ? "Terminos aceptados"
                    : "Terminos no aceptados",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

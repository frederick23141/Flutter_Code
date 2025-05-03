import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:curso_app/pages/models/apigif.dart';
import 'package:http/http.dart' as http;

class GifPage extends StatefulWidget {
  const GifPage({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<GifPage> {
  @override
  void initState() {
    super.initState();
    _listadoGifs = _getGifs();
  }

  //future para usar pausas y resolver el tiempo d espera
  late Future<List<Gifc>> _listadoGifs;

  final url = Uri.parse(
    'https://api.giphy.com/v1/gifs/trending?api_key=CBMtS5EJaI27Mp4vWnON7soLWDcYpBYQ&limit=6&offset=0&rating=g&bundle=low_bandwidth',
  );

  Future<List<Gifc>> _getGifs() async {
    final response = await http.get(url);
    List<Gifc> gifs = [];
    if (response.statusCode == 200) {
      // Convertir la respuesta en un objeto JSON
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);
      print(jsonData["data"]);
      // Acceder a la lista de gifs dentro del objeto JSON
      for (var gif in jsonData["data"]) {
        gifs.add(Gifc(gif["url"]));
      }
      return gifs;
    } else {
      throw Exception("fallo la consulta al servidor");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange, // <- fuerza el color del AppBar
          foregroundColor: Colors.white, // <- texto e íconos blancos
        ),
      ),
      title: "Gif Api",
      home: Scaffold(
        appBar: AppBar(title: Text("Gif Page")),
        body: FutureBuilder(
          future: _listadoGifs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print(snapshot.data);
              return ListView(children: _listGifs(snapshot.data!));
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  List<Widget> _listGifs(List<Gifc> data) {
    List<Widget> gif = [];
    for (var gifq in data) {
      gif.add(
        Card(
          child: Column(
            children: [ListTile(title: Text(gifq.name), subtitle: Text("Gif"))],
          ),
        ), //Card
      );
    }
    return gif;
  }
}

import 'package:card_swiper/card_swiper.dart';
import 'package:curso_app/views/drawer/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Carrusel extends StatefulWidget {
  const Carrusel({super.key});

  @override
  State<Carrusel> createState() => _MyAppState();
}

class _MyAppState extends State<Carrusel> {
  final List<String> imglist = [
    'https://picsum.photos/id/1011/300/200',
    'https://picsum.photos/id/1025/300/200',
    'https://picsum.photos/id/1035/300/200',
    'https://picsum.photos/id/1043/300/200',
    'https://picsum.photos/id/1050/300/200',
    'https://picsum.photos/id/1062/300/200',
    'https://picsum.photos/id/1074/300/200',
    'https://picsum.photos/id/1084/300/200',
    'https://picsum.photos/id/1080/300/200',
    'https://picsum.photos/id/1081/300/200',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange, // <- fuerza el color del AppBar
          foregroundColor: Colors.white, // <- texto e íconos blancos
        ),
      ),
      title: 'Carrusel',
      home: Scaffold(
        drawer: Drawer(
          child: DrawerMenu(),
          // Aquí insertas el widget personalizado
        ),
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Container(child: _carrusel(imglist)),
      ),
    );
  }
}

Widget _carrusel(imglist) {
  return SizedBox(
    width: double.infinity,
    height: 250.0,
    child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        //imagen local
        // return Image(image: AssetImage("assets/lapp.png"));
        //imagen web para manejo de errores,
        return CachedNetworkImage(
          imageUrl: imglist[index],
          placeholder:
              (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        );
      },
      itemCount: imglist.length,
      pagination: SwiperPagination(),
      control: SwiperControl(),
      viewportFraction: 0.8,
      scale: 0.9,
    ),
  );
}

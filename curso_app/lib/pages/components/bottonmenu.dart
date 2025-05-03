import 'package:flutter/material.dart';

class BottonMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottonMenu({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Configuración",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "alertas"),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class BottonMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottonMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

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
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_size_select_actual_rounded),
          label: "galeria",
        ),
      ],
    );
  }
}

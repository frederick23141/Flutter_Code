import 'package:curso_app/core/constants/constants.dart';
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
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: AppColors.primary),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: AppColors.primary),
          label: "Configuración",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.photo_size_select_actual_rounded,
            color: AppColors.primary,
          ),
          label: "galeria",
        ),
      ],
    );
  }
}

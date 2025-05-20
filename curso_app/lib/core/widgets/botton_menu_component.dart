import 'package:curso_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class BottonMenuComponent extends StatefulWidget {
  final Function(int) onItemTapped;

  BottonMenuComponent({super.key, required this.onItemTapped});

  @override
  State<BottonMenuComponent> createState() => _BottonMenuComponentState();
}

class _BottonMenuComponentState extends State<BottonMenuComponent> {
  int _selectedIndex = 0;

  BottomNavigationBarType _bottomNavType = BottomNavigationBarType.fixed;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.primaryDark,
      unselectedItemColor: const Color(0xff757575),
      type: _bottomNavType,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: _navBarItems,
    );
  }
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.bookmark_border_outlined),
    activeIcon: Icon(Icons.bookmark_rounded),
    label: 'Bookmarks',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_outlined),
    activeIcon: Icon(Icons.shopping_bag),
    label: 'Cart',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
];

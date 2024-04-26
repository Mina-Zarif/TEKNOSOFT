import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {super.key, required this.index, required this.onTap});

  final int index;
  final Function(int value) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (value) => onTap(value),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kBackgroundColor,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
      iconSize: 28,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(EneftyIcons.home_outline),
          label: "•",
          tooltip: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(EneftyIcons.shopping_cart_outline),
          label: "•",
          tooltip: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(EneftyIcons.heart_outline),
          label: '•',
          tooltip: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(EneftyIcons.profile_outline),
          label: "•",
          tooltip: 'Profile',
        ),
      ],
    );
  }
}

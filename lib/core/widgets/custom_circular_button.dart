import 'package:flutter/material.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({
    super.key,
    required this.onTap,
    this.backgroundColor = const Color(0xfff5f5f5),
    required this.icon,
    this.iconColor = Colors.black,
    this.radius = 25,
  });

  final VoidCallback onTap;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: Icon(
          icon,
          color: iconColor,
          size: 25,
        ),
      ),
    );
  }
}

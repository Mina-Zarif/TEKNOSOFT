import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {super.key, this.width, this.height, this.label, required this.onTap, this.backgroundColor});

  final double? width;
  final double? height;
  final String? label;
  final VoidCallback onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: width,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0xfff8cd2e),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            label ?? "",
            style: Styles.textStyle20,
          ),
        ),
      ),
    );
  }
}

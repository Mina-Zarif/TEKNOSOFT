import 'package:flutter/material.dart';

class NavToSignupLogin extends StatelessWidget {
  const NavToSignupLogin(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.onTap});

  final String firstText;
  final String secondText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        InkWell(
          onTap: () => onTap(),
          child: Text(
            secondText,
            style: const TextStyle(
              color: Color(0xffcc9f0a),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

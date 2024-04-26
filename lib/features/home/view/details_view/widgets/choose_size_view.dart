import 'package:flutter/material.dart';

class ChooseSize extends StatefulWidget {
  const ChooseSize({super.key});

  @override
  State<ChooseSize> createState() => _ChooseSizeState();
}

class _ChooseSizeState extends State<ChooseSize> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        6,
            (index) => InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: (selectedIndex == index)
                    ? Colors.grey.shade700
                    : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                '${index + 32}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

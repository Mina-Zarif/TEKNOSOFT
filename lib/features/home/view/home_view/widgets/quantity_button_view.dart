import 'package:flutter/material.dart';
import 'package:shopink/core/utils/styles.dart';
import 'package:shopink/core/widgets/custom_circular_button.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    super.key,
    this.width = 200,
    this.hight = 50,
    this.iconSize = 25,
    this.radius = 20,
  });

  final double width;
  final double radius;
  final double hight;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hight,
      decoration: BoxDecoration(
        color: const Color(0xfff1f1f2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomCircularButton(
              radius: radius,
              onTap: () {},
              icon: Icons.remove,
              backgroundColor: Colors.white,
            ),
            const Text(
              '1',
              style: Styles.textStyle20,
            ),
            CustomCircularButton(
              radius: radius,
              onTap: () {},
              icon: Icons.add,
              iconColor: Colors.white,
              backgroundColor: const Color(0xff142234),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_circular_button.dart';

class FavouriteItemView extends StatelessWidget {
  const FavouriteItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.3,
        dragDismissible: false,
        children: [
          SlidableAction(
            autoClose: true,
            onPressed: (context) {},
            backgroundColor: const Color(0xfff7ebec),
            foregroundColor: Colors.red,
            icon: EneftyIcons.trash_bold,
            borderRadius: BorderRadius.circular(15),
          ),
          const SizedBox(width: 15)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Nike Blazer Mid '77", style: Styles.textStyle20),
                  const Text("Women's Shoes", style: Styles.textStyle18),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("\$100.99", style: Styles.textStyle20),
                      CustomCircularButton(
                        onTap: () {},
                        // icon: EneftyIcons.heart_bold,
                        icon: EneftyIcons.heart_outline,
                        // iconColor: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

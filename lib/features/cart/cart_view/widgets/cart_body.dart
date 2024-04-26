import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_app_button.dart';
import 'my_cart_item_view.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const MyCartItemView(),
              separatorBuilder: (context, index) =>
                  const Divider(color: kDividerColor),
              itemCount: 3,
            ),
            const Divider(color: kDividerColor),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Subtotal", style: Styles.textStyle16),
                Text(
                  "\$800.00",
                  style: Styles.textStyle16.copyWith(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Delivery Fee", style: Styles.textStyle16),
                Text(
                  "\$10.00",
                  style: Styles.textStyle16.copyWith(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Discount", style: Styles.textStyle16),
                Text(
                  "10%",
                  style: Styles.textStyle16.copyWith(color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: kDividerColor),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total", style: Styles.textStyle16),
                Text(
                  "\$780.00",
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomAppButton(
              onTap: () {},
              label: "Check out",
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

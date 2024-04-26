import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopink/features/home/date/models/product_model.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_app_button.dart';
import 'my_cart_item_view.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  double subTotal = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final FirebaseAuth auth = FirebaseAuth.instance;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('cart')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          subTotal = 0;
          for (var doc in snapshot.data!.docs) {
            subTotal += doc['price'];
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.475,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MyCartItemView(
                        productId: snapshot.data!.docs[index].id,
                        productModel: ProductModel.fromJson(
                          snapshot.data!.docs[index].data(),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(color: kDividerColor),
                    itemCount: snapshot.data!.size,
                  ),
                ),
                const Divider(color: kDividerColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal", style: Styles.textStyle16),
                    Text(
                      "\$$subTotal",
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
                      "\$${(subTotal + 10) - ((subTotal + 10) * 0.1)}",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
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
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

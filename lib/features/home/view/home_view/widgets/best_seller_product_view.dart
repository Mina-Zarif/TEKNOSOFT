import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopink/features/home/date/models/product_model/product_model.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_circular_button.dart';

class BestSellerProductsView extends StatelessWidget {
  const BestSellerProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('products')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.size,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 8,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (context, index) => BestSellerProductView(
              productId: snapshot.data!.docs[index].id,
              productModel:
                  ProductModel.fromJson(snapshot.data!.docs[index].data()),
              onTap: () {},
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class BestSellerProductView extends StatelessWidget {
  const BestSellerProductView(
      {super.key,
      required this.onTap,
      required this.productId,
      required this.productModel});

  final VoidCallback onTap;
  final String productId;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: 230,
            child: Card(
              elevation: 0.3,
              surfaceTintColor: Colors.white,
              color: const Color(0xfff8f6f6),
              shadowColor: Colors.white,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10,end: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Center(
                        child: Image.network(
                          productModel.imagesUrl![0],
                          fit: BoxFit.fill,
                          width: 125,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      productModel.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          productModel.type!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Styles.textStyle16,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${productModel.price}",
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomCircularButton(
              onTap: () async {
                try {
                  String currentUserUID =
                      FirebaseAuth.instance.currentUser!.uid;
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(currentUserUID)
                      .collection('products')
                      .doc(productId)
                      .update(
                      {'isFavorite': !productModel.isFavorite!});
                } on FirebaseAuthException catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.message!)));
                  }
                }
              },
              backgroundColor: Colors.white,
              iconColor: (productModel.isFavorite! == false)
                  ? Colors.black
                  : Colors.red,
              icon: (productModel.isFavorite! == false)
                  ? EneftyIcons.heart_outline
                  : EneftyIcons.heart_bold,
            ),
          )
        ],
      ),
    );
  }
}

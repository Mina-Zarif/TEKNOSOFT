import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopink/features/favourite/favourite_view/widgets/favourite_item_view.dart';
import 'package:shopink/features/home/date/models/product_model.dart';

import '../../../../constants.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('favourite')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView.separated(
              itemBuilder: (context, index) => FavouriteItemView(
                productId: snapshot.data!.docs[index].id,
                productModel:
                    ProductModel.fromJson(snapshot.data!.docs[index].data()),
              ),
              separatorBuilder: (context, index) =>
                  const Divider(color: kDividerColor),
              itemCount: snapshot.data!.size,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(color: kMainColor),
        );
      },
    );
  }
}

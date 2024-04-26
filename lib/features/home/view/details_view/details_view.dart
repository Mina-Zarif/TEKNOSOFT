import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/utils/go_router.dart';
import 'package:shopink/core/widgets/custom_appbar.dart';
import 'package:shopink/core/widgets/custom_circular_button.dart';
import 'package:shopink/features/home/date/models/category_type.dart';
import 'package:shopink/features/home/date/models/product_model.dart';
import 'package:shopink/features/home/view/details_view/widgets/details_body_view.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
    required this.categoryType,
    required this.productId,
  });

  final CategoryType categoryType;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: CustomAppBar(
        backgroundColor: kBackgroundColor,
        leading: CustomCircularButton(
          icon: EneftyIcons.arrow_left_3_outline,
          onTap: () => AppRouter.router.pop(),
          backgroundColor: Colors.white,
        ),
        action: CustomCircularButton(
          onTap: () {},
          icon: Icons.more_horiz_rounded,
          backgroundColor: Colors.white,
        ),
        title: const Text(
          "Shopink",
          style: Styles.textStyle24,
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(auth.currentUser!.uid)
              .collection(categoryType.name)
              .doc(productId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DetailsBodyView(
                productModel: ProductModel.fromJson(snapshot.data!.data()!),
                productId: productId,
                categoryType: categoryType,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

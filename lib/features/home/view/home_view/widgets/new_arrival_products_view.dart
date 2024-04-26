import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/fire_services/fire_services.dart';
import 'package:shopink/features/home/date/models/category_type.dart';
import 'package:shopink/features/home/date/models/product_model.dart';

import '../../../../../core/utils/go_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_circular_button.dart';

class NewArrivalProductsView extends StatelessWidget {
  const NewArrivalProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection(CategoryType.new_arrival.name)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 290,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: snapshot.data!.size,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) {
                return NewArrivalProductView(
                  productId: snapshot.data!.docs[index].id,
                  productModel:
                      ProductModel.fromJson(snapshot.data!.docs[index].data()),
                  onTap: () => AppRouter.router.push(
                    AppRouter.detailsView,
                    extra: {
                      'productId': snapshot.data!.docs[index].id,
                      'categoryType': CategoryType.new_arrival,
                    },
                  ),
                );
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class NewArrivalProductView extends StatelessWidget {
  NewArrivalProductView(
      {super.key,
      required this.onTap,
      required this.productModel,
      required this.productId});

  final VoidCallback onTap;
  final ProductModel productModel;
  final String productId;
  final FireServices fireServices = FireServices();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: 230,
        child: Card(
          elevation: 0.3,
          surfaceTintColor: Colors.white,
          color: const Color(0xfff8f6f6),
          shadowColor: Colors.white,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 10),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    CustomCircularButton(
                      onTap: () async {
                        await fireServices.toggleFavorite(
                          productId: productId,
                          productModel: productModel,
                          categoryType: CategoryType.new_arrival,
                          onSuccess: () {},
                          onError: (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e),
                              ),
                            );
                          },
                        );
                      },
                      backgroundColor: Colors.white54,
                      iconColor: (productModel.isFavorite! == false)
                          ? Colors.black
                          : Colors.red,
                      icon: (productModel.isFavorite! == false)
                          ? EneftyIcons.heart_outline
                          : EneftyIcons.heart_bold,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

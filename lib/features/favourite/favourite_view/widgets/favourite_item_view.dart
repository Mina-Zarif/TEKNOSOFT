import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopink/core/fire_services/fire_services.dart';
import 'package:shopink/features/home/date/models/product_model.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_circular_button.dart';

class FavouriteItemView extends StatelessWidget {
  FavouriteItemView({
    super.key,
    required this.productModel,
    required this.productId,
  });

  final ProductModel productModel;
  final String productId;
  final FireServices fireServices = FireServices();

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
            onPressed: (context) async {
              await fireServices.toggleFavorite(
                productId: productId,
                productModel: productModel,
                categoryType: productModel.categoryType!,
                onSuccess: () {},
                onError: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error)),
                  );
                },
              );
            },
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
            Image.network(
              productModel.imagesUrl![0],
              width: 100,
              height: 100,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title!,
                    style: Styles.textStyle20,
                    maxLines: 1,
                  ),
                  Text(productModel.type!, style: Styles.textStyle18),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${productModel.price}",
                        style: Styles.textStyle20,
                      ),
                      CustomCircularButton(
                        onTap: () async {
                          await fireServices.addToCart(
                            product: productModel,
                            onSuccess: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Added to cart"),
                                ),
                              );
                            },
                            onError: (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e),
                                ),
                              );
                            },
                          );
                        },
                        icon: EneftyIcons.shopping_cart_outline,
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

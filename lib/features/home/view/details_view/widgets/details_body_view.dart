import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/fire_services/fire_services.dart';
import 'package:shopink/core/widgets/custom_app_button.dart';
import 'package:shopink/core/widgets/custom_circular_button.dart';
import 'package:shopink/features/home/date/models/category_type.dart';
import 'package:shopink/features/home/date/models/product_model.dart';

import '../../../../../core/utils/styles.dart';
import '../../home_view/widgets/quantity_button_view.dart';
import 'choose_size_view.dart';

class DetailsBodyView extends StatelessWidget {
  DetailsBodyView({
    super.key,
    required this.productModel,
    required this.productId,
    required this.categoryType,
  });

  final ProductModel productModel;
  final String productId;
  final CategoryType categoryType;
  final FireServices fireServices = FireServices();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(productModel.imagesUrl![0]),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 25,
                    start: 25,
                    end: 25,
                    bottom: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.title!,
                        style: Styles.textStyle24,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(productModel.type!,
                                  style: Styles.textStyle18),
                              const SizedBox(height: 10),
                              Text("\$${productModel.price}",
                                  style: Styles.textStyle24),
                            ],
                          ),
                          CustomCircularButton(
                            onTap: () async {
                              await fireServices.toggleFavorite(
                                productId: productId,
                                productModel: productModel,
                                categoryType: productModel.categoryType!,
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
                      const SizedBox(height: 10),
                      const ChooseSize(),
                      const SizedBox(height: 10),
                      Text(
                        productModel.description!,
                        style: Styles.textStyle18,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuantityButton(width: size.width * 0.34),
              CustomAppButton(
                onTap: () async {
                  await fireServices.addToCart(
                    product: productModel,
                    onSuccess: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product added to cart'),
                        ),
                      );
                    },
                    onError: (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error),
                        ),
                      );
                    },
                  );
                  // await addProductToCartIfNotExists(productModel);
                },
                label: "Add to cart",
                width: size.width * 0.5,
              )
            ],
          ),
        ),
      ],
    );
  }
}

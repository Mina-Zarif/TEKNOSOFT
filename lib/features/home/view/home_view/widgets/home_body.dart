import 'package:flutter/material.dart';
import 'package:shopink/core/utils/styles.dart';

import '../../../../../constants.dart';
import 'best_seller_product_view.dart';
import 'new_arrival_products_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              kBannerImage,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("New Arrival", style: Styles.textStyle24),
            Text("See all", style: Styles.textStyle16),
          ],
        ),
        const SizedBox(height: 20),
        const NewArrivalProductsView(),
        const SizedBox(height: 30),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Best Seller", style: Styles.textStyle24),
            Text("See all", style: Styles.textStyle16),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CategoryItemView(
              color: kMainColor,
              label: "All",
            ),
            CategoryItemView(
              label: 'Nike',
              color: Colors.grey.shade200,
            ),
            CategoryItemView(
              label: 'Adidas',
              color: Colors.grey.shade200,
            ),
            CategoryItemView(
              label: 'New Balance',
              color: Colors.grey.shade200,
            ),
            CategoryItemView(
              label: 'Puma',
              color: Colors.grey.shade200,
            ),
          ],
        ),
        const SizedBox(height: 20),
        const BestSellerProductsView(),
      ],
    );
  }
}

class CategoryItemView extends StatelessWidget {
  const CategoryItemView({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 40,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(child: Text(label)),
    );
  }
}

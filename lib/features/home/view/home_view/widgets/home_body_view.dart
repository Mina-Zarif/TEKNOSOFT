import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/utils/styles.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import 'best_seller_product_view.dart';
import 'home_body.dart';
import 'new_arrival_products_view.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            backgroundColor: Colors.transparent,
            leading: CustomCircularButton(
              icon: EneftyIcons.menu_outline,
              onTap: () {},
            ),
            action: CustomCircularButton(
              onTap: () {},
              icon: EneftyIcons.notification_outline,
              backgroundColor: kBackgroundColor,
            ),
            title: const Text(
              "Shopink",
              style: Styles.textStyle24,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: HomeBody(),
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:shopink/features/favourite/favourite_view/widgets/favourite_item_view.dart';

import '../../../../constants.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) => const FavouriteItemView(),
        separatorBuilder: (context, index) =>
        const Divider(color: kDividerColor),
        itemCount: 3,
      ),
    );
  }
}


import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/features/cart/cart_view/widgets/cart_body.dart';

import '../../../constants.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_circular_button.dart';
import '../../home/mange/home_cubit.dart';

class CartBodyView extends StatelessWidget {
  const CartBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = BlocProvider.of(context);
    return Column(
      children: [
        CustomAppBar(
          backgroundColor: Colors.transparent,
          leading: CustomCircularButton(
            icon: EneftyIcons.arrow_left_3_outline,
            onTap: () => cubit.setState(() => cubit.currentIndex = 0),
          ),
          action: CustomCircularButton(
            onTap: () {},
            icon: Icons.more_horiz,
            backgroundColor: kBackgroundColor,
          ),
          title: const Text(
            "My Cart",
            style: Styles.textStyle24,
          ),
        ),
        const Divider(
          color: kDividerColor,
        ),
        const Expanded(child: CartBody()),
      ],
    );
  }
}

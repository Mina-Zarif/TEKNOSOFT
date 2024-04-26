import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/utils/go_router.dart';
import 'package:shopink/core/widgets/custom_app_button.dart';
import 'package:shopink/core/widgets/custom_appbar.dart';
import 'package:shopink/core/widgets/custom_circular_button.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';
import '../home_view/widgets/quantity_button_view.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const DetailsBodyView(),
    );
  }
}

class DetailsBodyView extends StatelessWidget {
  const DetailsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          height: size.height * 0.45,
          color: kBackgroundColor,
        ),
        Expanded(
          child: Container(
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsetsDirectional.only(
                top: 25, start: 25, end: 25, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Nike Air Max 270", style: Styles.textStyle24),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Women's Shoes", style: Styles.textStyle18),
                        SizedBox(height: 10),
                        Text("\$150", style: Styles.textStyle24),
                      ],
                    ),
                    CustomCircularButton(
                      onTap: () {},
                      icon: EneftyIcons.heart_outline,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                    (index) => Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: true
                              ? Colors.grey.shade700
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 32}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Styled for the '70s.Loved in the '80s.Classic in the '90s.Ready for the future.The Nike Blazer Mid '77 Next",
                  style: Styles.textStyle18,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                const Text("Read More ...", style: Styles.textStyle20),
                const Spacer(),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuantityButton(
                        width: size.width * 0.34,
                      ),
                      CustomAppButton(
                        onTap: () {},
                        label: "Add to cart",
                        width: size.width * 0.5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

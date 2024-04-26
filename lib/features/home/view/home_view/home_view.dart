import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/features/cart/cart_view/cart_view.dart';
import 'package:shopink/features/home/mange/home_cubit.dart';
import 'package:shopink/features/home/view/home_view/widgets/custom_bottom_nav_bar.dart';
import 'package:shopink/features/home/view/home_view/widgets/home_body_view.dart';

import '../../../favourite/favourite_view/favourite_view.dart';
import '../../../profile/settings_view/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static List<Widget> screens = const [
    HomeBodyView(),
    CartBodyView(),
    FavouriteView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final HomeCubit cubit = BlocProvider.of(context);
          return Scaffold(
            body: SafeArea(child: screens[cubit.currentIndex]),
            bottomNavigationBar: CustomBottomNavBar(
              onTap: (value) =>
                  cubit.setState(() => cubit.currentIndex = value),
              index: cubit.currentIndex,
            ),
          );
        },
      ),
    );
  }
}

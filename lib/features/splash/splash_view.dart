import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopink/constants.dart';
import 'package:shopink/core/utils/styles.dart';

import '../../core/utils/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int loadingProgress = 0;

  @override
  void initState() {
    super.initState();
    startLoadingAnimation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "ShopInk",
              style: Styles.textStyle24,
            ),
            SizedBox(height: size.height * 0.03),
            DotsIndicator(
              dotsCount: 4,
              mainAxisSize: MainAxisSize.min,
              position: loadingProgress,
              decorator: const DotsDecorator(
                color: Color(0xffc9e1b9),
                activeColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startLoadingAnimation() {
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        if (loadingProgress == 3) {
          checkUserSignIn();
        } else {
          loadingProgress = (loadingProgress + 1) % (4);
          startLoadingAnimation();
        }
      });
    });
  }

  void checkUserSignIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      AppRouter.router.pushReplacement(AppRouter.homeView);
    } else {
      AppRouter.router.pushReplacement(AppRouter.loginView);
    }
  }

// void navigateToHome() {
//   Future.delayed(const Duration(seconds: 3), () => checkUserSignIn());
// }
}

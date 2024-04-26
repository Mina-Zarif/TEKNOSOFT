import 'package:go_router/go_router.dart';
import 'package:shopink/features/home/date/models/category_type.dart';
import 'package:shopink/features/home/view/details_view/details_view.dart';
import 'package:shopink/features/profile/profile_view/profile_view.dart';

import '../../features/auth/presentation/views/login_view/login_view.dart';
import '../../features/auth/presentation/views/register_view/register_view.dart';
import '../../features/home/view/home_view/home_view.dart';
import '../../features/splash/splash_view.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String signupView = '/sign';
  static const String loginView = '/login';
  static const String homeView = '/home';
  static const String detailsView = '/details';
  static const String profileView = '/profile';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: signupView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: detailsView,
        builder: (context, state) {
          final Map<String, dynamic> extra =
              state.extra! as Map<String, dynamic>;
          return DetailsView(
            categoryType: extra['categoryType'] as CategoryType,
            productId: extra['productId'] as String,
          );
        },
      ),
      GoRoute(
        path: profileView,
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:shopink/constants.dart';
import 'package:shopink/core/utils/validation.dart';
import 'package:shopink/core/widgets/custom_app_button.dart';
import 'package:shopink/core/widgets/custom_text_field.dart';

import '../../../../../../core/utils/go_router.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../data/auth_service/auth_service.dart';
import '../../widgets/custom_nav_to_signup_login.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 30),
            Text(
              'Login now to explore our offers',
              style: Styles.textStyle18.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              controller: emailController,
              labelText: "Email",
              borderColor: Colors.grey,
              borderRadius: 20,
              iconData: Icons.email_outlined,
              validator: (value) => Validation.validateEmail(value),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              textInputType: TextInputType.visiblePassword,
              labelText: "Password",
              iconData: Icons.lock_outline,
              validator: (value) => Validation.validatePassword(value),
              obscureText: true,
              borderColor: Colors.grey,
              borderRadius: 20,
            ),
            const SizedBox(height: 30),
            Center(
              child: (!isLoading)
                  ? CustomAppButton(
                      width: 200,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          setState(() => isLoading = true);
                          authService.login(
                            email: emailController.text,
                            password: passwordController.text,
                            onError: (e) {
                              setState(() => isLoading = false);
                              return ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e)),
                              );
                            },
                            onSuccess: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Login Successfully!"),
                                ),
                              );
                              setState(() => isLoading = false);
                              AppRouter.router
                                  .pushReplacement(AppRouter.homeView);
                            },
                          );
                        }
                      },
                      label: "Login",
                    )
                  : const CircularProgressIndicator(color: Color(0xfff6cc2e)),
            ),
            const SizedBox(height: 20),
            NavToSignupLogin(
              onTap: () =>
                  AppRouter.router.pushReplacement(AppRouter.signupView),
              firstText: 'Don\'t have account?',
              secondText: '  Sign in here',
            ),
          ],
        ),
      ),
    );
  }
}

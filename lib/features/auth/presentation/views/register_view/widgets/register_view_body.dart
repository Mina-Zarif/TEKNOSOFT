import 'package:flutter/material.dart';
import 'package:shopink/core/utils/validation.dart';
import 'package:shopink/core/widgets/custom_app_button.dart';
import 'package:shopink/core/widgets/custom_text_field.dart';
import 'package:shopink/features/auth/data/models/user_model/user_model.dart';

import '../../../../../../core/utils/go_router.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../data/auth_service/auth_service.dart';
import '../../widgets/custom_nav_to_signup_login.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final AuthService authService = AuthService();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!',
                style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 30),
              Text(
                'Register now to explore our offers',
                style: Styles.textStyle18.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: fullNameController,
                labelText: 'Full Name',
                borderColor: Colors.grey,
                borderRadius: 20,
                iconData: Icons.person_outlined,
                validator: (value) => value!.isEmpty ? 'Enter Full Name' : null,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                labelText: "Email",
                borderColor: Colors.grey,
                borderRadius: 20,
                textInputType: TextInputType.emailAddress,
                validator: (value) => Validation.validateEmail(value),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                labelText: "Password",
                obscureText: true,
                textInputType: TextInputType.visiblePassword,
                borderColor: Colors.grey,
                borderRadius: 20,
                validator: (value) => Validation.validatePassword(value),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: confirmPasswordController,
                labelText: "Confirm Password",
                obscureText: true,
                textInputType: TextInputType.visiblePassword,
                borderColor: Colors.grey,
                borderRadius: 20,
                validator: (value) => Validation.validatePassword(value),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: phoneController,
                labelText: "Phone Number",
                borderColor: Colors.grey,
                borderRadius: 20,
                textInputType: TextInputType.phone,
                validator: (value) => Validation.requiredValidator(value),
              ),
              const SizedBox(height: 25),
              Center(
                child: (!isLoading)
                    ? CustomAppButton(
                        width: 200,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              setState(() => isLoading = true);
                              authService.signUp(
                                user: UserModel(
                                  email: emailController.text,
                                  fullName: fullNameController.text,
                                  phone: phoneController.text,
                                ),
                                password: passwordController.text,
                                onError: (error) {
                                  setState(() => isLoading = false);
                                  return ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(content: Text(error)),
                                  );
                                },
                                onSuccess: () {
                                  setState(() => isLoading = false);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Signed up Successfully!"),
                                    ),
                                  );
                                  AppRouter.router
                                      .pushReplacement(AppRouter.homeView);
                                },
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Signed up successfully"),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Password doesn't match"),
                                ),
                              );
                            }
                          }
                        },
                        label: "Register",
                      )
                    : const CircularProgressIndicator(color: Color(0xfff6cc2e)),
              ),
              const SizedBox(height: 25),
              NavToSignupLogin(
                onTap: () =>
                    AppRouter.router.pushReplacement(AppRouter.loginView),
                firstText: 'Already have account?',
                secondText: ' Log in here',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

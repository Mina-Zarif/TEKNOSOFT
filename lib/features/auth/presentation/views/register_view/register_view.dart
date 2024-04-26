import 'package:flutter/material.dart';
import 'package:shopink/features/auth/presentation/views/register_view/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: const RegisterViewBody(),
    );
  }
}

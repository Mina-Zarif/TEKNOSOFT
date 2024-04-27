import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/utils/go_router.dart';
import 'package:shopink/features/profile/profile_view/widgets/profile_body.dart';

import '../../../constants.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_circular_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        leading: CustomCircularButton(
          icon: EneftyIcons.arrow_left_3_outline,
          onTap: () => AppRouter.router.pop(),
        ),
        title: const Text(
          "Settings",
          style: Styles.textStyle24,
        ),
      ),
      body: const Column(
        children: [
          Divider(color: kDividerColor),
          Expanded(child: ProfileBody()),
        ],
      ),
    );
  }
}

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/utils/go_router.dart';
import 'package:shopink/core/widgets/custom_app_button.dart';

import '../../../constants.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_circular_button.dart';
import '../../../core/widgets/custom_text_field.dart';

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
        // action: CustomCircularButton(
        //   onTap: () {},
        //   icon: Icons.more_horiz,
        //   backgroundColor: kBackgroundColor,
        // ),
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

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              kProfileImage,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Mina Zarif",
            style: Styles.textStyle24,
          ),
          const Text(
            "Flutter Developer",
            style: Styles.textStyle16,
          ),
          const SizedBox(height: 30),
          const Expanded(child: EditProfileDetails()),
          const SizedBox(height: 30),
          CustomAppButton(
            onTap: () {},
            label: "Save",
            width: 200,
            backgroundColor: Colors.amber,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class EditProfileDetails extends StatelessWidget {
  const EditProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            CustomTextField(
              controller: TextEditingController(),
              borderRadius: 20,
              enabled: true,
              borderColor: Colors.grey,
              labelText: 'Full Name',
              validator: (value) {},
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: TextEditingController(),
              borderRadius: 20,
              enabled: true,
              borderColor: Colors.grey,
              labelText: 'Bio',
              validator: (value) {},
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: TextEditingController(),
              labelText: 'Email',
              textInputType: TextInputType.emailAddress,
              borderColor: Colors.grey,
              borderRadius: 20,
              validator: (value) {},
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: TextEditingController(),
              labelText: 'phone',
              textInputType: TextInputType.phone,
              borderColor: Colors.grey,
              borderRadius: 20,
              validator: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

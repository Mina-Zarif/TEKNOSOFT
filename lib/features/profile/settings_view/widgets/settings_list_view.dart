import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/utils/go_router.dart';

import 'custom_settings_item.dart';

class SettingsListView extends StatelessWidget {
  const SettingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        CustomSettingsItem(
          onTap: () {},
          text: "Notification",
          iconData: EneftyIcons.notification_outline,
        ),
        const SizedBox(height: 30),
        CustomSettingsItem(
          onTap: () {},
          text: "Language",
          iconData: EneftyIcons.language_circle_outline,
        ),
        const SizedBox(height: 30),
        CustomSettingsItem(
          onTap: () {},
          text: "Privacy",
          iconData: EneftyIcons.lock_outline,
        ),
        const SizedBox(height: 30),
        CustomSettingsItem(
          onTap: () {},
          text: "Help Center",
          iconData: Icons.help_outline,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomSettingsItem(
          onTap: () {},
          text: "About Us",
          iconData: EneftyIcons.warning_2_outline,
        ),
        const SizedBox(height: 30),
        CustomSettingsItem(
          onTap: () {
            try {
              FirebaseAuth.instance.signOut();
              AppRouter.router.pushReplacement(AppRouter.loginView);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.toString()),
                ),
              );
            }
          },
          text: "Logout",
          iconData: EneftyIcons.logout_outline,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

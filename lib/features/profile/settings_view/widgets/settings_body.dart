import 'package:flutter/material.dart';
import 'package:shopink/constants.dart';
import 'package:shopink/features/profile/settings_view/widgets/settings_list_view.dart';

import '../../../../core/utils/styles.dart';
import 'account_view.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account', style: Styles.textStyle20),
          SizedBox(height: 15),
          AccountView(),
          SizedBox(height: 8),
          Divider(color: kDividerColor),
          SizedBox(height: 18),
          Text(
            "Settings",
            style: Styles.textStyle20,
          ),
          SizedBox(height: 20),
          Expanded(child: SettingsListView()),
        ],
      ),
    );
  }
}

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/utils/go_router.dart';

import 'name_bio_view.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRouter.router.push(AppRouter.profileView),
      splashColor: Colors.grey[100],
      highlightColor: Colors.grey[100],
      borderRadius: BorderRadius.circular(10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 25,
            child: const Icon(EneftyIcons.profile_outline, size: 28),
          ),
          const SizedBox(width: 15),
          const NameAndBio(
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}

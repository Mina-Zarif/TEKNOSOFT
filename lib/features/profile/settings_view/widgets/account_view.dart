import 'package:flutter/material.dart';
import 'package:shopink/core/utils/go_router.dart';

import '../../../../constants.dart';
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
            backgroundImage: const NetworkImage(kProfileImage),
          ),
          const SizedBox(width: 15),
          const NameAndBio(
            name: "Mina Zarif",
            email: "mine1062016665@gmail.com",
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

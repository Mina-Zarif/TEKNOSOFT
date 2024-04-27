import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/utils/go_router.dart';

import '../../../../constants.dart';
import '../../../../core/fire_services/fire_services.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../auth/data/models/user_model/user_model.dart';
import 'edit_profile_details.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final FireServices fireServices = FireServices();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserModel userModel = UserModel.fromJson(snapshot.data!.data()!);
          fullNameController.text = userModel.fullName!;
          phoneController.text = userModel.phone!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 30),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 25,
                  child: const Icon(EneftyIcons.profile_outline, size: 28),
                ),
                const SizedBox(height: 10),
                Text(
                  userModel.fullName!,
                  style: Styles.textStyle24,
                ),
                Text(
                  userModel.email!,
                  style: Styles.textStyle16,
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: EditProfileDetails(
                    fullNameController: fullNameController,
                    bioController: bioController,
                    phoneController: phoneController,
                  ),
                ),
                const SizedBox(height: 30),
                CustomAppButton(
                  onTap: () async {
                    await fireServices.updateProfile(
                        fullName: fullNameController.text,
                        bio: bioController.text,
                        phone: phoneController.text,
                        onSuccess: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Profile Updated"),
                            ),
                          );
                          AppRouter.router.pop();
                        },
                        onError: (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e),
                            ),
                          );
                        });
                  },
                  label: "Save",
                  width: 200,
                  backgroundColor: Colors.amber,
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: kMainColor,
          ),
        );
      },
    );
  }
}

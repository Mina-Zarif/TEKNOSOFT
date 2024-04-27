import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class NameAndBio extends StatelessWidget {
  const NameAndBio({
    super.key,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final CrossAxisAlignment crossAxisAlignment;

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
            return Column(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                Text(
                  snapshot.data!['fullName'],
                  style: Styles.textStyle24.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 5),
                Text(
                  snapshot.data!['email'],
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

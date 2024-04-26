import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopink/features/auth/data/models/user_model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> signUp({
    required UserModel user,
    required String password,
    required Function(String error) onError,
    required Function() onSuccess,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.email ?? "",
        password: password,
      );
      // Store additional user data in Firestore
      await _usersCollection.doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': user.email,
        'fullName': user.fullName,
        'phone': user.phone,
        'createdAt': Timestamp.now(),
      });
      await copyCollection(_auth);
      onSuccess();
    } on FirebaseException catch (e) {
      onError(e.message ?? "Unknown error, Please try again");
    }
  }

  Future<void> copyCollection(
    FirebaseAuth auth,
  ) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    QuerySnapshot productsQuery = await firestore.collection("products").get();
    QuerySnapshot newArrivalQuery =
        await firestore.collection("new_arrival").get();

    for (QueryDocumentSnapshot sourceDoc in productsQuery.docs) {
      Map<String, dynamic> data = sourceDoc.data() as Map<String, dynamic>;
      await firestore
          .collection("users").doc(auth.currentUser!.uid)
          .collection("products").add(data);
    }
    for (QueryDocumentSnapshot sourceDoc in newArrivalQuery.docs) {
      Map<String, dynamic> data = sourceDoc.data() as Map<String, dynamic>;
      await firestore
          .collection("users").doc(auth.currentUser!.uid)
          .collection("new_arrival").add(data);
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required Function(String error) onError,
    required Function() onSuccess,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
    } on FirebaseException catch (e) {
      onError(e.message ?? "Unknown error, Please try again");
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopink/features/home/date/models/category_type.dart';

import '../../features/home/date/models/product_model.dart';

class FireServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> toggleFavorite({
    required String productId,
    required ProductModel productModel,
    required CategoryType categoryType,
    required Function() onSuccess,
    required Function(String error) onError,
  }) async {
    {
      try {
        await firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .collection(categoryType.name)
            .doc(productId)
            .update({'isFavorite': !productModel.isFavorite!});

        DocumentReference productRef = firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .collection('favourite')
            .doc(productId);
        DocumentSnapshot productSnapshot = await productRef.get();
        if (productSnapshot.exists) {
          await productRef.delete();
        } else {
          await productRef.set(productModel.toJson());
        }
        onSuccess();
      } on FirebaseAuthException catch (e) {
        onError(e.message!);
      }
    }
  }

  Future<void> deleteFromCart(
      {required String productId,
      required Function() onSuccess,
      required Function(String error) onError}) async {
    try {
      firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .doc(productId)
          .delete();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message!);
    }
  }

  Future<void> addToCart({
    required ProductModel product,
    required Function() onSuccess,
    required Function(String error) onError,
  }) async {
    try {
      CollectionReference userCartRef = firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart');

      QuerySnapshot<Object?> querySnapshot = await userCartRef
          .where(
            'id',
            isEqualTo: product.id,
          ) // assuming 'id' is the field to check
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        await userCartRef.add(product.toJson());
        onSuccess();
      } else {
        onError('Product already exists in the cart');
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message!);
    }
  }

  Future<void> updateProfile({
    required String fullName,
    required String bio,
    required String phone,
    required Function(String error) onError,
    required Function() onSuccess,
  }) async {
    try {
      await firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'fullName': fullName,
        'phone': phone,
      });
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message!);
    }
  }
}

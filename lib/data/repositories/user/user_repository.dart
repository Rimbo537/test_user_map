import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_user_map/src/domain/models/user_model.dart';

mixin IUserRepo {
  Future<void> createUser(UserModel user);
  // Future<UserModel> getUserData();
}

class UserRepository implements IUserRepo {
  final curUser = FirebaseAuth.instance.currentUser!;
  final firestoreUserData = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> createUser(UserModel user) async {
    /// Reference to document
    final docUser = firestoreUserData.doc(curUser.uid);
    user = user.copyWith(id: docUser.id);

    final json = user.toJson();

    /// Create document and write data to Firebase
    await docUser.set(json);
  }

  // @override
  // Future<UserModel> getUserData() => firestoreUserData
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .get()
  //     .then((data) => UserModel.fromJson(data.data() as Map<String, dynamic>).copyWith(id: data.id));
}

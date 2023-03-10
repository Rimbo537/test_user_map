import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_user_map/src/domain/models/user_model.dart';

mixin IUserRepo {
  Future<void> createUser(UserModel user);
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
}

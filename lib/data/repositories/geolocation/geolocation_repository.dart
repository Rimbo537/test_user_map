import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_user_map/src/domain/models/user_model.dart';

mixin IGeolocationRepo {
  Future<Position> getCurrentLocation();
  Future<User?> getCurrentUser();
  Future<List<UserModel>> getUserData();
}

class GeolocationRepository implements IGeolocationRepo {
  final firestoreUserData = FirebaseFirestore.instance.collection('users');



  @override
  Future<Position> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disable');
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request',
      );
    }
    return Geolocator.getCurrentPosition();
  }

  @override
  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<List<UserModel>> getUserData() async {
    List<UserModel> userList = [];
  
    try {
      final users = await FirebaseFirestore.instance.collection("users").get();
      users.docs.forEach((element) {
        return userList.add(UserModel.fromJson(element.data()));
      });
      return userList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // @override
  // Future<UserModel> getUserData() => firestoreUserData
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .get()
  //     .then((data) => UserModel.fromJson(data.data() as Map<String, dynamic>)
  //         .copyWith(id: data.id));
}

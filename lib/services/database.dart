// ignore_for_file: empty_constructor_bodies

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/models/user.dart';

class DatabaseService {
  final uid;

  DatabaseService({this.uid});

  final CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<void> saveUser(String name, String email) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'email': email,
    });
  }

  AppUserData _userFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    return AppUserData(
      uid: snapshot.id,
      name: data['name'],
      email: data['email'],
    );
  }

  Stream<AppUserData> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }
}

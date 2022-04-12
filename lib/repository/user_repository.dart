import 'dart:async';

import '../models/user.dart';

class UserRepository {
  User? _user;

  var firebaseUser = FirebaseAuth.instance.currentUser;

      firestoreInstance
          .collection("users")
          .doc(firebaseUser!.uid)
          .get()
          .then((value) {
        // Map<String, dynamic> data = value.data() as Map<String, dynamic>;
        state.loadUser(value.data());
        // clean up code
      });

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(const Uuid().v4()),
    );
  }
}
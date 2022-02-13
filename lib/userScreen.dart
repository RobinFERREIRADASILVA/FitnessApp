// ignore_for_file: file_names

import 'package:fitness_app/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/user.dart';
import 'package:fitness_app/services/authentication.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/StateModel.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AppUserData?>(context);
    final firestoreInstance = FirebaseFirestore.instance;

    print(currentUser);

    return Consumer<StateModel>(builder: (context, state, child) {
      print(state.user);

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Fitness App'),
          actions: [
            TextButton.icon(
                onPressed: () async {
                  // await _auth.signOut();
                  var firebaseUser = FirebaseAuth.instance.currentUser;
                  firestoreInstance
                      .collection("users")
                      .doc(firebaseUser!.uid)
                      .get()
                      .then((value) {
                    state.loadUser(value.data());
                  });
                },
                icon: const Icon(Icons.person),
                label: const Text('Deconnexion'))
          ],
        ),
        body: Text('Bonsoir ${state.user} '),
      );
    });
  }
}

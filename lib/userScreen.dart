// ignore_for_file: file_names

import 'package:fitness_app/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/user.dart';
import 'package:fitness_app/services/authentication.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
    final firestoreInstance = FirebaseFirestore.instance;

    return Consumer<StateModel>(builder: (context, state, child) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // title: const Text('Fitness App'),
          elevation: 0,
          actions: [
            TextButton.icon(
                onPressed: () async {
                  // await _auth.signOut();
                },
                icon: const Icon(Icons.person),
                label: const Text('Deconnexion'))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.center,
                  colors: [
                    Colors.black87,
                    Colors.black,
                  ]),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                headerPart,
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Vos entrainements',
                        style: TextStyle(color: Colors.white)),
                    Text('Voir tous')
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

Widget headerPart = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      width: 300,
      child: Text(
        "Dépassez vos limites, plus d'excuses",
        style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            letterSpacing: 3),
      ),
    ),
    Container(
      margin: EdgeInsets.only(top: 13),
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
            'https://www.paris-catch.fr/assets/images/actu/shawn-michael-present-au-1000e-raw620.jpg'),
      ),
    )
  ],
);

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/services/authentication.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text('Fitness App'),
      actions: [
        TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.person),
            label: Text('Deconnexion'))
      ],
    ));
  }
}

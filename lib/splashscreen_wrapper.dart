import 'package:fitness_app/home.dart';
import 'package:fitness_app/models/user.dart';
import 'package:fitness_app/userScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreenWrapper extends StatelessWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    print(user);

    if (user == null) {
      return HomePage(title: 'Fitness App');
    } else {
      return UserHome();
    }
  }
}

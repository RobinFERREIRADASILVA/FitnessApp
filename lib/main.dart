import 'package:flutter/material.dart';
import 'package:fitness_app/home.dart';
import 'package:fitness_app/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: 'Fitness App'),
        '/signup': (context) => SignUp(),
      },
    );
  }
}

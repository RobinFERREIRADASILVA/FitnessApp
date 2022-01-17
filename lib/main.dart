import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/services/authentication.dart';
import 'package:fitness_app/splashscreen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/home.dart';
import 'package:fitness_app/signup.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthenticationService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fitness App',
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreenWrapper(),
          '/signup': (context) => SignUp(),
        },
      ),
    );
  }
}

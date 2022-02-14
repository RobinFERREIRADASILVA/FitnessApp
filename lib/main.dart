import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/models/StateModel.dart';
import 'package:fitness_app/services/authentication.dart';
import 'package:fitness_app/services/database.dart';
import 'package:fitness_app/splashscreen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/signup.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => StateModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthenticationService().user,
        initialData: null,
        child: StreamProvider.value(
          value: DatabaseService().user,
          initialData: [],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.robotoTextTheme(
                Theme.of(context).textTheme,
              ).apply(
                bodyColor: Colors.white,
              ),
            ),
            title: 'Fitness App',
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreenWrapper(),
              '/signup': (context) => SignUp(),
            },
          ),
        ));
  }
}

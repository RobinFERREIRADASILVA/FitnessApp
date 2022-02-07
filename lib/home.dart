import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:fitness_app/models/StateModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(builder: (context, state, child) {
      var stateAccess = context.read<StateModel>();

      return Scaffold(
          body: Column(
        children: [
          Stack(children: [
            Image.asset('images/home.jfif'),
            Positioned(
                top: 350,
                left: 0,
                right: 0,
                child: Text('Fitness App',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.abrilFatface(
                        color: Colors.white, fontSize: 35))),
          ]),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.black, border: Border(top: BorderSide.none)),
              child: Column(children: [
                ElevatedButton(
                    onPressed: () {
                      stateAccess.changeRegisterState(false);

                      Navigator.pushNamed(context, '/signup');
                    },
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.indigo,
                        elevation: 4,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                            left: MediaQuery.of(context).size.width / 2.8,
                            right: MediaQuery.of(context).size.width / 2.8)),
                    child: Text('Se connecter',
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.black, fontSize: 16))),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      stateAccess.changeRegisterState(true);

                      Navigator.pushNamed(context, '/signup');
                    },
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.indigo,
                        elevation: 4,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                            left: MediaQuery.of(context).size.width / 2.6,
                            right: MediaQuery.of(context).size.width / 2.6)),
                    child: Text("S'inscrire",
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.black, fontSize: 16))),
              ]),
            ),
          )
        ],
      )
          // This trailing comma makes auto-formatting nicer for build methods.
          );
    });
  }
}

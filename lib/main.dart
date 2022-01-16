import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      home: HomePage(title: 'Fitness App'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.indigo,
                      elevation: 4,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: MediaQuery.of(context).size.width / 2.8,
                          right: MediaQuery.of(context).size.width / 2.8)),
                  child: Text('Se connecter',
                      style: GoogleFonts.robotoCondensed(
                          color: Colors.black, fontSize: 16))),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.indigo,
                      elevation: 4,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
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
  }
}

import 'package:fitness_app/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/loading.dart';
import 'package:provider/provider.dart';

import 'models/StateModel.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthenticationService _auth = AuthenticationService();
  // int _counter = 0;
  String userEmail = '';
  String userPassword = '';
  String error = '';
  bool loading = false;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Consumer<StateModel>(builder: (context, state, child) {
            return Scaffold(
                body: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        border: Border(top: BorderSide.none)),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/logo.jpg',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          height: 470,
                          colorBlendMode: BlendMode.hardLight,
                        ),
                        Expanded(
                            child: Container(
                                child: Column(
                          children: [
                            Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    if (state.register)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 10,
                                            right: 10),
                                        child: TextFormField(
                                          controller: emailController,
                                          decoration: const InputDecoration(
                                            labelText: 'Nom',
                                            labelStyle: TextStyle(
                                                color: Color(0xFF6a6b76)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF6a6b76),
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF6a6b76),
                                                  width: 1.0),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Veuillez rentrer un email';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 10,
                                          right: 10),
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: const InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: TextStyle(
                                              color: Color(0xFF6a6b76)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            borderSide: BorderSide(
                                                color: Color(0xFF6a6b76),
                                                width: 1.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            borderSide: BorderSide(
                                                color: Color(0xFF6a6b76),
                                                width: 1.0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez rentrer un email';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 10,
                                          right: 10),
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            borderSide: BorderSide(
                                                color: Color(0xFF6a6b76),
                                                width: 1.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            borderSide: BorderSide(
                                                color: Color(0xFF6a6b76),
                                                width: 1.0),
                                          ),
                                          labelText: 'Mot de passe',
                                          labelStyle: TextStyle(
                                              color: Color(0xFF6a6b76)),
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 6) {
                                            return 'Veuillez rentrer un mot de passe';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Text(error),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            onPrimary: Colors.indigo,
                                            elevation: 4,
                                            primary: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            padding: EdgeInsets.only(
                                                top: 15,
                                                bottom: 15,
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.8,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.8)),
                                        onPressed: () async {
                                          // Validate returns true if the form is valid, or false otherwise.
                                          if (formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              loading = true;
                                            });
                                            String password =
                                                passwordController.value.text;
                                            String email =
                                                emailController.value.text;

                                            dynamic result = !state.register
                                                ? await _auth.signIn(
                                                    email, password)
                                                : await _auth.registerUser(
                                                    email, password);
                                            print(result);

                                            if (result == null) {
                                              setState(() {
                                                loading = false;
                                                error =
                                                    'Please supply a valid email';
                                              });
                                            }
                                          }
                                        },
                                        child: Text(
                                          !state.register
                                              ? 'Se connecter'
                                              : "S'inscrire",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ],
                                ))
                          ],
                        )))
                      ],
                    )));
          });
  }
}

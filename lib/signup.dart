import 'package:fitness_app/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/loading.dart';

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
  bool showSignIn = true;

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
        : Scaffold(
            body: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(showSignIn ? 'Se connecter' : 'Inscription'),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez rentrer un email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: 'Mot de passe',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
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
                                onPressed: () async {
                                  // Validate returns true if the form is valid, or false otherwise.
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    String password =
                                        passwordController.value.text;
                                    String email = emailController.value.text;

                                    dynamic result = showSignIn
                                        ? await _auth.signIn(email, password)
                                        : await _auth.registerUser(
                                            email, password);
                                    print(result);

                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        error = 'Please supply a valid email';
                                      });
                                    }
                                  }
                                },
                                child: Text(showSignIn
                                    ? 'Se connecter'
                                    : "S'inscrire")),
                          ],
                        ))
                  ],
                )));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:snake_game_v2/Authentication/User%20Data.dart';

import 'ForgetPasswordPage.dart';
import 'SignUpPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _errorMassage = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/login.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 130, bottom: 20, right: 25, left: 25),
          child: Column(
            children: [
              Text("Welcome Back!\nLogin",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.black,
                    fontFamily: "Raleway",
                    height: 1.2,
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignUpPage();
                    }));
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  child: const Text("New User? Register",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans'))),
              SizedBox(height: 40),
              Form(
                key: formKey2,
                child: Column(
                  children: [
                    TextFormField(
                        validator: (value) {
                          if (value!.contains('@gmail.com')) {
                            return null;
                          }
                          return 'Please enter a valid Gmail!';
                        },
                        onChanged: (value) => _email = value,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)))),
                    const SizedBox(height: 20),
                    TextFormField(
                        validator: (input) {
                          if (input!.length < 6) {
                            return 'Your password needs to be at least 6 character';
                          }
                          return null;
                        },
                        obscureText: true,
                        onChanged: (value) => _password = value,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Text(_errorMassage),
              const SizedBox(height: 2),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPasswordPage()));
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      textStyle: MaterialStatePropertyAll(
                          TextStyle(decoration: TextDecoration.underline))),
                  child: const Text("Forgot Password?",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans'))),
              const SizedBox(height: 40),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text("Sign In",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 32,
                        fontFamily: "Raleway")),
                FloatingActionButton(
                    onPressed: () async {
                      if (formKey2.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _email.trim(),
                                  password: _password.trim());
                        } on FirebaseAuthException catch (e) {
                          setState(() => _errorMassage = e.message!);
                        }

                        User? user = FirebaseAuth.instance.currentUser;
                      }
                    },
                    child: const Icon(Icons.arrow_forward))
              ]),
              const SizedBox(height: 30),
              FloatingActionButton.extended(
                  onPressed: () async {
                    final googleUser = await GoogleSignIn().signIn();
                    if (googleUser == null) return;
                    final googleAuth = await googleUser.authentication;
                    final credential = GoogleAuthProvider.credential(
                        accessToken: googleAuth.accessToken,
                        idToken: googleAuth.idToken);
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                    } catch (e) {
                      setState(() => _errorMassage = e.toString());
                    }

                    FirebaseAuth.instance.currentUser?.reload();
                  },
                  icon: Image.asset('images/google_logo.png',
                      height: 28, width: 28),
                  label: const Text('Sign in with Google'),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

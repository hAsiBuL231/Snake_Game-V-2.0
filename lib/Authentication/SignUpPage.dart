import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SignInPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _error = '';
  String _message = '';
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
              const EdgeInsets.only(top: 120, bottom: 20, right: 20, left: 20),
          child: Column(
            children: [
              Text("Create New\nAccount",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontFamily: "Raleway",
                    height: 1.2,
                  )),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                child: const Text("Already Registered? Login",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) => _name = value,
                      decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          labelText: 'Name',
                          hintText: 'Your name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      validator: (value) {
                        if (value!.contains('@gmail.com')) {
                          return null;
                        }
                        return 'Please enter a valid Gmail!';
                      },
                      onChanged: (value) => _email = value,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Your password needs to be at least 6 character!';
                        }
                        return null;
                      },
                      onChanged: (value) => _password = value,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      validator: (input) {
                        if (input != _password) {
                          return 'Your password needs to be matched previous one!';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 10),
                    Text(_message),
                    const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                          FloatingActionButton(
                              onPressed: () async {
                                if (formKey.currentState!
                                    .validate()) {
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                        email: _email.trim(),
                                        password:
                                        _password.trim());
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      _error =
                                      'The password provided is too weak.';
                                    } else if (e.code == 'email-already-in-use') {
                                      _error =
                                      'The account already exists for that email.';
                                    } else {
                                      _error = e.message!;
                                    }
                                  }

                                  User? user = FirebaseAuth.instance.currentUser;
                                  if(user != null)
                                  {
                                    print('User is Signed in!');
                                  }
                                }
                                setState(() {
                                  _message=_error;
                                });
                              },
                              child: const Icon(Icons.arrow_forward))
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

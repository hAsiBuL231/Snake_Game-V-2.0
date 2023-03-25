import 'package:flutter/material.dart';

import 'forget_pass.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/login.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 150),
                child: const Text("Welcome Back!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontFamily: "Raleway",
                      height: 1.2,
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: const Text("Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontFamily: "Raleway",
                      height: 1.2,
                    )),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ForgetPasswordPage();
                  }));
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.lightBlueAccent)),
                child: const Text("Forgot Password?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 50, left: 35, right: 35),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 28,
                              fontFamily: "Raleway"),
                        ),
                        CircleAvatar(
                          radius: 28,
                          child: IconButton(
                            onPressed: () {

                            },
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    )
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

import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/login.png"), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 180),
                child: const Text("Reset\nPassword",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontFamily: "Raleway",
                      height: 1.2,
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 70, left: 35, right: 35),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Send Request",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                        fontFamily: "Raleway"),
                  ),
                  CircleAvatar(
                    radius: 28,
                    child: IconButton(
                      onPressed: () => Null,
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  )
                ],
              )
            ]))));
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snake_game_v2/Authentication/SignInPage.dart';

import 'HomePage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double _progressValue = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_progressValue == 1.0) {
            timer.cancel();
            _timer?.cancel();
            User? user = FirebaseAuth.instance.currentUser;
            if (user == null) {
              print('User is currently signed out!');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInPage()));
            } else {
              print('User is logged in!');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          } else {
            _progressValue += 0.2;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/cover.png'),
                      fit: BoxFit.fitHeight))),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                Image(
                    image: AssetImage('images/cover.png'),
                    height: 100,
                    width: 200),
                SizedBox(height: 60),
                Text(
                  'SnakeHost\nVersion-2.0',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.brown,
                      fontFamily: 'GideonRoman'),
                  textScaleFactor: 2,
                ),
                SizedBox(height: 130),
                CircularProgressIndicator(),
                SizedBox(height: 30),
                Text("Loading",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'GideonRoman')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

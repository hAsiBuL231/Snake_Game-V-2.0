/*

import 'package:flutter/material.dart';
import 'package:snake_game_v2/UI%20Design%20Folder/HomePage.dart';
import 'package:splashscreen/splashscreen.dart';

import '../Authentication/SignInPage.dart';

class Splash1 extends StatelessWidget {
  Image img = Image.asset('images/cover.png');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SIGN IN",
      home: SplashScreen(
        imageBackground: img.image,
        seconds: 3,
        navigateAfterSeconds: new SignInPage(),
        title: new Text(
          'SnakeHost\nVersion-2.0',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.brown,
              fontFamily: 'GideonRoman'),
          textScaleFactor: 2,
        ),
        image: Image.asset('images/cover.png', fit: BoxFit.cover),
        loadingText: Text("Loading",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'GideonRoman')),
        photoSize: 100.0,
        loaderColor: Colors.blue,
      ),
    );
  }
}

class Splash2 extends StatelessWidget {
  Image img = Image.asset('images/cover.png');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SIGN IN",
      home: SplashScreen(
        imageBackground: img.image,
        seconds: 3,
        navigateAfterSeconds: new HomePage(),
        title: new Text(
          'SnakeHost\nVersion-2.0',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.brown,
              fontFamily: 'GideonRoman'),
          textScaleFactor: 2,
        ),
        image: Image.asset('images/cover.png', fit: BoxFit.cover),
        loadingText: Text("Loading",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'GideonRoman')),
        photoSize: 100.0,
        loaderColor: Colors.blue,
      ),
    );
  }
}


 */
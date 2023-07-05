import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'UI Design Folder/WelcomePage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    await FirebaseAppCheck.instance.activate(
      //webRecaptchaSiteKey: 'recaptcha-v3-site-key',
      androidProvider: AndroidProvider.playIntegrity,
      //appleProvider: AppleProvider.appAttest,
    );
  } catch (e) {
    print('Error during Firebase initialization: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Snake Game",
        home: WelcomePage());
  }
}

/*
  User? user = FirebaseAuth.instance.currentUser;
  //FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
      runApp(Splash1());
    } else {
      print('User is signed in!');
      runApp(Splash2());
    }
  //});
*/

/*
  var initial = 'login';
  bool isLogin = Auth().isUserLoggedIn(email: Auth().currentUser!.email.toString()) as bool;
  if (isLogin) {
    initial = 'homepage';
  }
  runApp(MyApp(fstRoute: initial,key: initial,));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      debugShowCheckedModeBanner: false,
      home: Splash1(),
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => HomePage(),
        'all pages': (context) => const AllPagesClass(),
        'login': (context) => LoginPage(),
        'signup': (context) => const SignUpPage(),
      },
    );
  }
}
*/

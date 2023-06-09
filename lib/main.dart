import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'SplashScreen.dart';
import 'dart:async';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
      runApp(Splash1());
    } else {
      print('User is signed in!');
      runApp(Splash2());
    }
  });
}

/*var initial = 'login';

  bool isLogin = Auth().isUserLoggedIn(email: Auth().currentUser!.email.toString()) as bool;
  if (isLogin) {
    initial = 'homepage';
  }
  runApp(MyApp(fstRoute: initial,key: initial,));*/

/*
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

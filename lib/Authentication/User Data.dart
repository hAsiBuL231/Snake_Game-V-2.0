import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SignInPage.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final userEmail = FirebaseAuth.instance.currentUser?.email;
    final userName = FirebaseAuth.instance.currentUser?.displayName;
    final userImage = FirebaseAuth.instance.currentUser?.photoURL;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SignInPage',
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login.png'),
                    fit: BoxFit.fill)),
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                const SizedBox(height: 150),
                const Text('User Profile:',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontFamily: 'GideonRoman')),
                const SizedBox(height: 20),
                CircleAvatar(
                    radius: 60, backgroundImage: NetworkImage('$userImage')),
                const SizedBox(height: 20),
                Text('Name: $userName',
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
                const SizedBox(height: 20),
                Text('Email: $userEmail',
                    style: const TextStyle(fontSize: 18, color: Colors.black)),
                const SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('Go to HomePage',
                        style: TextStyle(fontSize: 24))),
                const SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      User? user = FirebaseAuth.instance.currentUser;
                      if(user != null)
                      {
                        print('User is Signed in!');
                      }
                    },
                    child: const Text('Logout')),
              ],
            ),
          ),
        ));
  }
}

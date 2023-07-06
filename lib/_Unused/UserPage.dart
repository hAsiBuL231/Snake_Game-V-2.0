import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snake_game_v2/UI%20Design%20Folder/HomePage.dart';


class UserPage_Old extends StatefulWidget {
  const UserPage_Old({Key? key}) : super(key: key);

  @override
  State<UserPage_Old> createState() => _UserPage_OldState();
}

class _UserPage_OldState extends State<UserPage_Old> {
  final userEmail = FirebaseAuth.instance.currentUser?.email;
  final userName = FirebaseAuth.instance.currentUser?.displayName;
  final userImage = FirebaseAuth.instance.currentUser?.photoURL;

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
                    },
                    child: const Text('Go to HomePage',
                        style: TextStyle(fontSize: 24))),
                const SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: const Text('Logout')),
              ],
            ),
          ),
        ));
  }
}

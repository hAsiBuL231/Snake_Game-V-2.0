import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snake_game_v2/Authentication/SignInPage.dart';
import 'package:snake_game_v2/UI%20Design%20Folder/HomePage.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? userEmail = FirebaseAuth.instance.currentUser?.email;
  String? userName = FirebaseAuth.instance.currentUser?.displayName;
  String? userImage = FirebaseAuth.instance.currentUser?.photoURL;

  String phone = 'loading..';
  String profession = 'loading..';
  String location = 'loading..';
  String dob = 'loading..';
  String language = 'loading..';
  String joined = 'loading..';
  String difference = 'loading..';

  _getData() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var querySnapshot = await collection.where(FieldPath(['$userEmail'])).get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      var data = queryDocumentSnapshot.data();
      setState(() {
        phone = data['phone'];
        profession = data['profession'];
        location = data['location'];
        dob = data['dob'];
        language = data['language'];
        Timestamp getTime = data['joined'];
        DateTime joinTime = getTime.toDate();
        joined = joinTime.toString();
        DateTime time = DateTime.now();
        DateTime currentDate = DateTime(time.year, time.month, time.day);
        difference = currentDate.difference(joinTime).inDays.toString();
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 16, 5, 16),
              height: 210,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Colors.purple]),
              ),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CircleAvatar(
                      radius: 50, backgroundImage: NetworkImage('$userImage')),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0),
                        Text(userName!,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.0),
                        Text(profession,
                            style: TextStyle(fontSize: 16, color: Colors.white))
                      ]),
                ]),
                SizedBox(height: 16.0),
                Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Followers',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        SizedBox(height: 4.0),
                        Text('1.2k',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                      ]),
                  SizedBox(width: 16.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Following',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        SizedBox(height: 4.0),
                        Text('980',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                      ]),
                ]),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Name'),
                      subtitle: Text('$userName')),
                  ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email'),
                      subtitle: Text('$userEmail')),
                  ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Phone'),
                      subtitle: Text(phone)),
                  ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Location'),
                      subtitle: Text(location)),
                  ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Date of Birth'),
                      subtitle: Text(dob)),
                  ListTile(
                      leading: Icon(Icons.language),
                      title: Text('Languages'),
                      subtitle: Text(language)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'App Usage',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Joined'),
                      subtitle: Text(joined)),
                  ListTile(
                      leading: Icon(Icons.timer),
                      title: Text('Total App Usage'),
                      subtitle: Text('Days: $difference')),
                  ListTile(
                      leading: Icon(Icons.star),
                      title: Text('Favorite Feature'),
                      subtitle: Text('Push Notifications')),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    child: Text(
                      'Home',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }),
                ElevatedButton(
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    }),
              ],
            ),
          ],
        )));
  }
}

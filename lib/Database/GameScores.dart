import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../UI Design Folder/Functions.dart';

class GameScores extends StatefulWidget {
  @override
  GameScoresState createState() => GameScoresState();
}

class GameScoresState extends State<GameScores> {
  int highestScore = 0;

  Future<List<DocumentSnapshot>> _getDataFromFirebase() async {
    CollectionReference scores =
        FirebaseFirestore.instance.collection('scores');
    var snapshot = await scores.where(FieldPath(['$userEmail'])).get();

    return snapshot.docs;
  }

  //Stream<QuerySnapshot> _scoresStream =
  //    FirebaseFirestore.instance.collection('scores').where(FieldPath(['$userEmail'])).get().snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Scores'),
      ),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: _getDataFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          return ListView(
            children: snapshot.data!.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              highestScore = data['score'];
              return ListTile(
                title: Text(data['player']),
                subtitle: Text('Highest Score: $highestScore'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

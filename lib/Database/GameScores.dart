import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GameScores extends StatefulWidget {
  @override
  _GameScoresState createState() => _GameScoresState();
}

class _GameScoresState extends State<GameScores> {
  final Stream<QuerySnapshot> _scoresStream =
  FirebaseFirestore.instance.collection('scores').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Scores'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _scoresStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data() as Map<String, dynamic>;
              String score= data['score'].toString();
              return ListTile(
                title: Text(data['player']),
                subtitle: Text('Score: $score'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

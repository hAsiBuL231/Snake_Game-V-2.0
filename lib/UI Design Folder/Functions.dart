import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snake_game_v2/Database/GameScores.dart';

String? userEmail = FirebaseAuth.instance.currentUser?.email;

void nextPage(page, context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

/*Future<void> getHighestScore() async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('scores');
  // Get docs from collection reference
  QuerySnapshot querySnapshot =
      await _collectionRef.where(FieldPath(['$userEmail'])).get();
  // Get data from docs and convert map to List
  querySnapshot.docs.map((DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // Assign the value of the 'score' field to the 'highestScore' variable
    highestScore = data['score'] as int;
  });
}*/


Future<void> addScore(int score) async {
  if (score > GameScoresState().highestScore) {
    String? userName = FirebaseAuth.instance.currentUser?.displayName;
    CollectionReference scores =
        FirebaseFirestore.instance.collection('scores');
    await scores
        .doc('$userEmail')
        .set({
          'player': userName.toString(),
          'score': score,
        })
        .then((value) => SnackBar(content: Text('Score added')))
        .catchError((error) => SnackBar(content: Text('Error: $error')));
  }
}

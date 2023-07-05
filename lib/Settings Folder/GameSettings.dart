/*
make a beautiful flutter game settings page with gorgeous colors.
 it will have 3 game level: easy, medium, hard. implementation of
  game level will be in one line. then it will have a function to
   select a number and user will be able to reduce or increase it
    in a function. then it will have two game mode to select.
 */

import 'package:flutter/material.dart';
import '../Database/globals.dart';

class GameSettings extends StatefulWidget {
  @override
  GameSettingsState createState() => GameSettingsState();
}

class GameSettingsState extends State<GameSettings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Text('Select Game Level',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontFamily: 'GideonRoman')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          gLevel == 200 ? Colors.blue : Colors.grey,
                    ),
                    child: Text('Easy'),
                    onPressed: () => setState(() => gLevel = 200)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          gLevel == 150 ? Colors.blue : Colors.grey,
                    ),
                    child: Text('Medium'),
                    onPressed: () => setState(() => gLevel = 150)),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          gLevel == 100 ? Colors.blue : Colors.grey,
                    ),
                    child: Text('Hard'),
                    onPressed: () => setState(() => gLevel = 100)),

              ],
            ),
            SizedBox(height: 30),
            Text('Select Grid Column Number',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'GideonRoman')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  iconSize: 36.0,
                  icon: Icon(Icons.remove),
                  onPressed: gColumn > 20
                      ? () => setState(() => gColumn--)
                      : null,
                ),
                Text(gColumn.toString(),
                    style: TextStyle(fontSize: 36.0)),
                IconButton(
                  iconSize: 36.0,
                  icon: Icon(Icons.add),
                  onPressed: gColumn < 50
                      ? () => setState(() => gColumn++)
                      : null,
                ),
              ],
            ),
            SizedBox(height: 30),
            Text('Select Game Mode',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontFamily: 'GideonRoman')),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          gMode == 'Closed' ? Colors.blue : Colors.grey,
                    ),
                    child: Text('Mode1: Boxed'),
                    onPressed: () => setState(() => gMode = 'Closed'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          gMode == 'Opened' ? Colors.blue : Colors.grey,
                    ),
                    child: Text('Mode2: Open'),
                    onPressed: () => setState(() => gMode = 'Opened'),
                  )
                ]),
            SizedBox(height: 30),
            Text('Select System Mode',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontFamily: 'GideonRoman')),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      gSystem == 'Touch' ? Colors.blue : Colors.grey,
                    ),
                    child: Text('Mode1: Touch'),
                    onPressed: () => setState(() {
                      gSystem = 'Touch';
                      gColumn = 36;
                    }),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      gSystem == 'Button' ? Colors.blue : Colors.grey,
                    ),
                    child: Text('Mode2: Button'),
                    onPressed: () => setState(() {
                      gSystem = 'Button';
                      gColumn=20;
                    }),
                  )
                ])
          ],
        ),
      ),
    );
  }
}

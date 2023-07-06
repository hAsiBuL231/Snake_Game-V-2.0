import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake_game_v2/Database/GameScores.dart';
import 'package:snake_game_v2/Database/UserProfile.dart';
import 'package:snake_game_v2/Settings%20Folder/GameSettings.dart';
import 'package:snake_game_v2/UI%20Design%20Folder/Functions.dart';

import 'InfoPage.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome to Drawer",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
      body: Column(
        children: [
          Image(image: AssetImage('images/cover.png'), fit: BoxFit.fitWidth),
          Flexible(
            child: ListView(children: <Widget>[
              ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text("Profile"),
                  onTap: () => nextPage(UserProfile(), context)),
              ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text("Info"),
                  onTap: () => nextPage(InfoPage(), context)),
              ListTile(
                  leading: Icon(Icons.leaderboard),
                  title: Text("Leaderboard"),
                  onTap: () => nextPage(GameScores(), context)),
              ListTile(
                  leading: Icon(Icons.help_outline),
                  title: TextButton(
                      child: Text("Help & Support"), onPressed: null)),
              ListTile(
                  leading: Icon(Icons.feedback_outlined),
                  title: TextButton(child: Text("Feedback"), onPressed: null)),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () => nextPage(GameSettings(), context)),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Exit'),
                onTap: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

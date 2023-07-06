import 'package:flutter/material.dart';
import 'package:snake_game_v2/Database/GameScores.dart';
import 'package:snake_game_v2/Database/UserData.dart';
import 'package:snake_game_v2/Database/UserProfile.dart';
import 'package:snake_game_v2/Game%20Pages/ManualPageOpen.dart';
import 'package:snake_game_v2/Game%20Pages/Tic_Tac_Game.dart';
import 'package:snake_game_v2/Settings%20Folder/GameSettings.dart';
import 'package:snake_game_v2/Settings%20Folder/InfoPage.dart';
import 'package:snake_game_v2/UI%20Design%20Folder/Functions.dart';
import '../Game Pages/GamePageClosed.dart';
import '../Game Pages/GamePageOpen.dart';
import '../Game Pages/ManualPageClosed.dart';
import '../Settings Folder/DrawerPage.dart';
import '../Database/globals.dart';
import 'AllPagesClass.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Drawer(child: DrawerPage()),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Flutter Snake Game"),
            leading: IconButton(
              onPressed: () => nextPage(DrawerPage(), context),
              icon: Icon(Icons.menu),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () => nextPage(AllPagesClass(), context),
                  icon: Icon(Icons.list_alt)),
              PopupMenuButton(itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      child: TextButton(
                          onPressed: () => nextPage(UserProfile(), context),
                          child: Text("Profile"))),
                  PopupMenuItem(
                      child: TextButton(
                          onPressed: () => nextPage(UserData(), context),
                          child: Text("User Data"))),
                  PopupMenuItem(
                      child: TextButton(
                          onPressed: () => nextPage(AllPagesClass(), context),
                          child: Text("All Pages"))),
                  PopupMenuItem(
                    child: ElevatedButton(
                        onPressed: () => nextPage(Tik_Tak_Game(), context),
                        child: const Text("Tic-Tac Game")),
                  )
                ];
              })
            ]),
        body: Center(
          child: Column(children: <Widget>[
            //SizedBox(height: 50),
            //ClipRRect(
            //    borderRadius: BorderRadius.circular(200.0),
            //    child: Image.asset('images/snake.png',
            //        width: 120.0, height: 120.0)),
            //const Padding(
            //   padding: EdgeInsets.fromLTRB(15, 150, 15, 50),
            //    child: Text("Welcome to\nSnakeHost",
            //        textAlign: TextAlign.center,
            //        style: TextStyle(
            //            fontFamily: 'Raleway',
            //            fontSize: 46,
            //            fontWeight: FontWeight.bold,
            //            color: Colors.black))),
            SizedBox(height: 300),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      if (gSystem == 'Touch') {
                        if (gMode == 'Opened')
                          return const GamePageOpen();
                        else
                          return const GamePageClosed();
                      } else {
                        if (gMode == 'Opened')
                          return const ManualPageOpen();
                        else
                          return const ManualPageClosed();
                      }
                    }));
                  },
                  child: Image(
                      image: AssetImage('images/Buttons/play.png'),
                      height: 80,
                      width: 80),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => nextPage(GameScores(), context),
                      child: Image(
                          image: AssetImage('images/Buttons/leader.png'),
                          height: 80,
                          width: 80),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () => nextPage(GameSettings(), context),
                      child: Image(
                          image: AssetImage('images/Buttons/settings.png'),
                          height: 80,
                          width: 80),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => nextPage(Tik_Tak_Game(), context),
                      child: Image(
                          image: AssetImage('images/Buttons/games.png'),
                          height: 80,
                          width: 80),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () => nextPage(InfoPage(), context),
                      child: Image(
                          image: AssetImage('images/Buttons/about.png'),
                          height: 80,
                          width: 80),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
        floatingActionButton: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 50,
            color: Colors.white,
          ),
          onPressed: () => nextPage(UserProfile(), context),
        ),
      ),
    );
  }
}

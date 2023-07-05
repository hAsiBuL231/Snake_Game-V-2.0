import 'package:flutter/material.dart';
import 'package:snake_game_v2/Database/UserProfile.dart';
import 'package:snake_game_v2/Game%20Pages/ManualPageOpen.dart';
import 'package:snake_game_v2/Settings%20Folder/InfoPage.dart';
import 'package:snake_game_v2/_Unused/Dead%20Code/SettingPage.dart';
import '../Game Pages/GamePageClosed.dart';
import '../Game Pages/GamePageOpen.dart';
import '../Game Pages/ManualPageClosed.dart';
import '../Settings Folder/drawer.dart';
import '../Database/globals.dart';
import 'all_pages.dart';

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
        drawer: const Func(),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Flutter Snake Game"),
            centerTitle: false,
            leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const Func();
                  }));
                }),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllPagesClass(),
                        ));
                  },
                  icon: const Icon(Icons.list_alt)),
              PopupMenuButton(itemBuilder: (BuildContext context) {
                return [const PopupMenuItem(child: Text("hello"))];
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
            SizedBox(height: 350),
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
                      image: AssetImage('images/Buttons/Play.png'),
                      height: 80,
                      width: 80),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingPage())),
                      child: Image(
                          image: AssetImage('images/Buttons/Setting.png'),
                          height: 80,
                          width: 80),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InfoPage())),
                      child: Image(
                          image: AssetImage('images/Buttons/Menu.png'),
                          height: 80,
                          width: 80),
                    )
                  ],
                ),
              ],
            ),
          ]),
        ),
        floatingActionButton: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 60,
            color: Colors.black,
          ),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserProfile())),
        ),
      ),
    );
  }
}

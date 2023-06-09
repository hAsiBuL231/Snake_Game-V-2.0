import 'package:flutter/material.dart';
import '../Game Files/touch_blocked.dart';
import '../Game Files/touch_open.dart';
import '../Settings Folder/drawer.dart';
import '../globals.dart';
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
              image: AssetImage("images/background.png"), fit: BoxFit.fill)),
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
            SizedBox(height: 50),
            ClipRRect(
                borderRadius: BorderRadius.circular(200.0),
                child: Image.asset('images/snake.png',
                    width: 120.0, height: 120.0)),
            const Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 50),
                child: Text("Welcome to\nSnakeHost",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  if (gBox == 'Opened') {
                    return const GamePageOpen();
                  } else {
                    return const GamePageClosed();
                  }
                }));
              },
              child: Image(
                  image: AssetImage('images/Start button.png'),
                  height: 230,
                  width: 230),
            )
          ]),
        ),
        floatingActionButton: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 50,
            color: Colors.lightGreen,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

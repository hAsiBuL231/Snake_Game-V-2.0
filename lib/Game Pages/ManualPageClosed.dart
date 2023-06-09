import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../Database/GameScores.dart';
import '../Database/globals.dart';
import '../UI Design Folder/Functions.dart';
import '../UI Design Folder/HomePage.dart';

enum Direction { up, down, left, right }

class ManualPageClosed extends StatefulWidget {
  const ManualPageClosed({super.key});
  @override
  State<ManualPageClosed> createState() => ManualPageClosedState();
}

class ManualPageClosedState extends State<ManualPageClosed> {
  Direction direction = Direction.down;
  var random = Random();
  int fruit = 50;
  int score = 0;
  var snakePosition = [0, 20, 40];
  bool _shouldRunCallback = true;


  startGame() {
    Future.delayed(Duration(milliseconds: gLevel), () {
      if (_shouldRunCallback) {
        setState(() {
          snakeMovement();
          if (snakePosition.contains(fruit)) {
            fruit = random.nextInt(grow * gColumn);
            score+=2;
          }
          final copyList = List.from(snakePosition);
          if (snakePosition.length > copyList.toSet().length) {
            gameOver();
          }
        });
      }
    });
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      fruit = 150;
      score = 0;
      snakePosition = [0, 20, 40];
      _shouldRunCallback = true;
    });
    startGame();
  }

  gameOver() {
    setState(() {
      _shouldRunCallback = false;
    });
    addScore(score);
    var hScore = GameScoresState().highestScore;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Game Over"),
              content: Text("Your Score is: $score\n"
                  "Current highest score: $hScore"),
              actions: [
                ElevatedButton(
                    onPressed: resetGame, child: const Text("Try Again")),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage())),
                    child: const Text("Exit"))
              ]);
        });
  }

  snakeMovement() {
    switch (direction) {
      case Direction.up:
        if (snakePosition.last < grow) {
          gameOver();
        } else {
          snakePosition.add(snakePosition.last - grow);
        }
        break;
      case Direction.down:
        if (snakePosition.last > grow * gColumn) {
          gameOver();
        } else {
          snakePosition.add(snakePosition.last + grow);
        }
        break;
      case Direction.left:
        if (snakePosition.last % grow == 0) {
          gameOver();
        } else {
          snakePosition.add(snakePosition.last - 1);
        }
        break;
      case Direction.right:
        if ((snakePosition.last + 1) % grow == 0) {
          gameOver();
        } else {
          snakePosition.add(snakePosition.last + 1);
        }
        break;
    }
    if (!snakePosition.contains(fruit)) {
      snakePosition.removeAt(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    //int profileH = MediaQuery.of(context).size.height.toInt();
    //int profileW = MediaQuery.of(context).size.width.toInt();
    startGame();
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Column(children: [
            Container(
                padding: const EdgeInsets.all(3),
                color: Colors.amber,
                child: Text("Score: $score",
                    style: const TextStyle(fontSize: 18))),
            Container(
              height: 440,
                color: Colors.red,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: grow * gColumn,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: grow,
                      //mainAxisSpacing: 0.5,
                      //crossAxisSpacing: 0.5,
                    ),
                    itemBuilder: (contex, index) {
                      if (snakePosition.last == index) {
                        return Container(color: Colors.green[900]);
                      } else if (snakePosition.first == index) {
                        return Container(color: Colors.green[300]);
                      } else if (snakePosition.contains(index)) {
                        return Container(color: Colors.green);
                      } else if (index == fruit) {
                        return Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/egg.png'),
                                    fit: BoxFit.fill),
                                shape: BoxShape.rectangle,
                                color: Colors.white));
                      } else {
                        return Container(color: Colors.white);
                      }
                    })),
            Container(
              height: 200,
                padding: const EdgeInsets.all(7),
                color: Colors.amber,
                child: Table(
                  children: [
                    TableRow(children: [
                      Container(),
                      SizedBox(
                        height: 60,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              direction = Direction.up;
                              //updateSnake();
                            },
                            icon: const Icon(Icons.arrow_upward_outlined),
                            label: const Text("Up")),
                      ),
                      Container()
                    ]),
                    TableRow(children: [
                      SizedBox(
                        height: 60,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              direction = Direction.left;
                              //updateSnake();
                            },
                            icon: const Icon(Icons.arrow_back),
                            label: const Text("Left")),
                      ),
                      Container(),
                      SizedBox(
                        height: 60,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              direction = Direction.right;
                              //updateSnake();
                            },
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text("Right")),
                      )
                    ]),
                    TableRow(children: [
                      Container(),
                      SizedBox(
                        height: 60,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              direction = Direction.down;
                              //updateSnake();
                            },
                            icon: const Icon(Icons.arrow_downward),
                            label: const Text("Down")),
                      ),
                      Container()
                    ])
                  ],
                )),
          ]),
        ),
        backgroundColor: Colors.blue[100]);
  }
}

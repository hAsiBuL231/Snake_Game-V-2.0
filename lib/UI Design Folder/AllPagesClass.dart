import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake_game_v2/Database/GameScores.dart';
import 'package:snake_game_v2/UI%20Design%20Folder/Functions.dart';
import 'package:snake_game_v2/_Unused/SampleSetup.dart';
import 'package:snake_game_v2/_Unused/UserPage.dart';
import 'package:snake_game_v2/Database/UserData.dart';
import 'package:snake_game_v2/Database/UserForm.dart';
import 'package:snake_game_v2/Database/UserProfile.dart';
import 'package:snake_game_v2/test.dart';
import 'package:snake_game_v2/test2.dart';

import '../Authentication/ForgetPasswordPage.dart';
import '../Authentication/SignInPage.dart';
import '../Authentication/SignUpPage.dart';
import '../Game Pages/Tic_Tac_Game.dart';
import 'HomePage.dart';

class AllPagesClass extends StatefulWidget {
  const AllPagesClass({Key? key}) : super(key: key);

  @override
  State<AllPagesClass> createState() => _AllPagesClassState();
}

class _AllPagesClassState extends State<AllPagesClass> {
  List<DropdownMenuItem<Object>> hi = [];
  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          bottomOpacity: 0.5,
          elevation: 80,
          foregroundColor: Colors.amber,
          shadowColor: Colors.black,
          leading: IconButton(
              onPressed: () => nextPage(HomePage(), context),
              icon: const Icon(Icons.cabin)),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
              //borderRadius: BorderRadiusDirectional.circular(20)),
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(25), right: Radius.circular(25))),
          title: const Text('All Pages'),
          actions: const [Icon(Icons.ac_unit)],
          bottom: const PreferredSize(
              preferredSize: Size(20, 20), child: Text('Appbar'))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => nextPage(SignInPage(), context),
              child: const Text("ElevatedButton : SignInPage"),
            ),
            TextButton(
                onPressed: () => nextPage(SignUpPage(), context),
                child: const Text("TextButton : SignUpPage")),
            TextButton(
                onPressed: () => nextPage(ForgetPasswordPage(), context),
                child: const Text('OutlineButton : ForgetPasswordPage')),
            ElevatedButton(
                onPressed: () => nextPage(UserForm(), context),
                child: const Text("ElevatedButton : UserForm")),
            TextButton(
                onPressed: () => nextPage(UserData(), context),
                child: const Text("FilledButton : UserData")),
            TextButton(
                onPressed: () => nextPage(UserProfile(), context),
                child: const Text("FilledButton : UserProfile")),
            IconButton(
                onPressed: () => nextPage(HomePage(), context),
                icon: const Icon(Icons.login)),
            FilledButton(
                onPressed: () => nextPage(UserPage_Old(), context),
                child: const Text("FilledButton : UserPage")),
            OutlinedButton(
                onPressed: () => nextPage(FirebaseDataScreen(), context),
                child: const Text('OutlineButton : Test Page')),
            OutlinedButton(
                onPressed: () => nextPage(FirebaseDataTable(), context),
                child: const Text('OutlineButton : Test Page 2')),
            ElevatedButton(
                onPressed: () => nextPage(Sample_Game(), context),
                child: const Text("ElevatedButton : Sample Game")),
            DropdownButton(
                // Initial Value
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() => dropdownvalue = newValue!);
                }),
            DropdownButton(items: [
              DropdownMenuItem(child: Text('Option 1'), value: 1),
              DropdownMenuItem(child: Text('Option 2'), value: 2),
              DropdownMenuItem(child: Text('Option 3'), value: 3),
              DropdownMenuItem(child: Text('Option 4'), value: 4),
              DropdownMenuItem(child: Text('Option 5'), value: 5),
            ], onChanged: (int? value) {}),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              BackButton(onPressed: () => Navigator.pop(context)),
              CloseButton(onPressed: () => SystemNavigator.pop())
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              FilledButton(
                  onPressed: () => nextPage(HomePage(), context),
                  child: const Text("FilledButton")),
              MaterialButton(
                  onPressed: () => nextPage(HomePage(), context),
                  child: const Text('Material Button'))
            ]),
          ],
        ),
      ),
    );
  }
}

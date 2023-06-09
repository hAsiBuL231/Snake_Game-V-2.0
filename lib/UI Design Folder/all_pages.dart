import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Authentication/ForgetPasswordPage.dart';
import '../Authentication/SignInPage.dart';
import '../Authentication/SignUpPage.dart';
import 'homepage.dart';

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
          elevation: 50,
          foregroundColor: Colors.amber,
          shadowColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
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
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          children: [
            FilledButton(
                onPressed: () {},
                child: const Text("FilledButton : LoginPage")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
                child: const Text("TextButton : SignUpClass")),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInPage()));
              },
              child: const Text("ElevatedButton : SignInClass"),
            ),
            OutlinedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetPasswordPage(),
                    )),
                child: const Text('OutlineButton : PassResetClass')),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: const Icon(Icons.login)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              FilledButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      )),
                  child: const Text("FilledButton")),
              MaterialButton(
                  child: const Text('Material Button'),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      )))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              BackButton(onPressed: () => Navigator.pop(context)),
              CloseButton(onPressed: () => SystemNavigator.pop())
            ]),
            DropdownButton(
                // Initial Value
                value: dropdownvalue,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                }),
            DropdownButton(
              items: [
                DropdownMenuItem(child: Text('Option 1'), value: 1),
                DropdownMenuItem(child: Text('Option 2'), value: 2),
                DropdownMenuItem(child: Text('Option 3'), value: 3),
                DropdownMenuItem(child: Text('Option 4'), value: 4),
                DropdownMenuItem(child: Text('Option 5'), value: 5),
              ],
              onChanged: (int? value) {},
            )
          ],
        ),
      ),
    );
  }
}

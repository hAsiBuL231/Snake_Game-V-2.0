import 'package:flutter/material.dart';
import 'UI Design Folder/all_pages.dart';
import 'UI Design Folder/homepage.dart';
import 'login file/sign_in_page.dart';
import 'login file/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';

/*Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}*/
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Snake Game",
      debugShowCheckedModeBanner: false,
      initialRoute: "homepage",
      routes: {
        'homepage': (context) => const HomePage(),
        'all pages': (context) => const AllPagesClass(),
        'login': (context) => const SignInPage(),
        'signup': (context) => const SignUpPage(),
      },
      //home: HomePage(),
    );
  }
}
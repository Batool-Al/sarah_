import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Start/start.dart';
import 'package:flutter_login_purple/constants.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.indigo[50],
      ),
      home: StartScreen(),
    );
  }
}

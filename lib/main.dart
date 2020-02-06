import 'package:flutter/material.dart';
import 'package:mamieapp/screens/home.dart';
import 'package:mamieapp/widgets/loginDropDownButton.dart';

void main() => runApp(MyApp());
// Test
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          //child: Home(),
          child: LoginButton(),
        ),
      ),
    );
  }
}
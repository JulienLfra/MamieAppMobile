import 'package:flutter/material.dart';
import 'package:mamieapp/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          child: Home(),
        ),
      ),
    );
  }
}
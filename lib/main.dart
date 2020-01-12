import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mamieapp/home.dart';
import 'package:mamieapp/redux/homeReducer.dart';

import 'package:redux/redux.dart';

import 'HomeState.dart';
import 'models/user.dart';

//void main() => runApp(new MyApp());
void main() {
  final _initialState = HomeState(new User("testinit", "testinit", "https://cdn.pixabay.com/photo/2019/11/23/05/06/happy-4646299_1280.jpg"));
  final Store<HomeState> _store = Store<HomeState>(counterReducer, initialState: _initialState);
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {

  // Redux
  final Store<HomeState> store;
  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Mamie App',
        home: new Home(),
      )
    );
  }
}


/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Mamiee',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black),
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.black, fontFamily: "Aveny")),
          textTheme: TextTheme(title: TextStyle(color: Colors.black))),
      home: new HomePage(),
    );
  }
}
*/
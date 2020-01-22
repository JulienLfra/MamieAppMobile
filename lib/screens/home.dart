import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mamieapp/api/api.dart';
import 'package:mamieapp/models/user.dart';
import 'package:mamieapp/models/user2.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/widgets/test.dart';
import '../widgets/map.dart';
import '../widgets/memberDetailCard.dart';
import '../widgets/membersListView.dart';
import '../widgets/familiesDropDownButton.dart';
import '../models/family.dart';
import 'settings.dart';

//---
class _MyInherited extends InheritedWidget {
  _MyInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final MyInheritedWidgetState data;

  @override
  bool updateShouldNotify(_MyInherited oldWidget) {
    return true;
  }
}

//---
class MyInheritedWidget extends StatefulWidget {
  MyInheritedWidget({
    Key key,
    this.child,
  }): super(key: key);

  final Widget child;

  @override
  MyInheritedWidgetState createState() => new MyInheritedWidgetState();

  static MyInheritedWidgetState of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(_MyInherited) as _MyInherited).data;
  }
}

//---
class MyInheritedWidgetState extends State<MyInheritedWidget> {

  Family family = new Family(0, "InitFamily");
  User user;

  void selectFamily(Family newFamily){
    setState((){
      this.family = newFamily;
    });
  }

  void selectUser(User newUser){
    setState((){
      this.user = newUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _MyInherited(
      data: this,
      child: widget.child,
    );
  }
}

//---
class Home extends StatefulWidget {

  @override
  HomeState createState() => new HomeState();
}

//---
class HomeState extends State<Home> {

  Future navigateToSettingPage(context) async {
    Navigator.push(
      context, MaterialPageRoute(
        builder: (context) => Settings(),
        settings: RouteSettings(
          arguments: userLogged
        )
      )
    );
    //Navigator.push(builder: (context) => Settings()));
  }

  var tabUser = new List<User2>();
  User2 userLogged;
  
  @override
  void initState() {
    super.initState();
    API.getUserByMail("plaideaug83170@gmail.com").then((response) {
      Iterable list = json.decode(response.body);
      tabUser = list.map((model) => User2.fromJson(model)).toList();
      userLogged = tabUser[0];
      print(userLogged.statut);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Global settings
    GlobalSettings settings = new GlobalSettings();
    return new MyInheritedWidget(
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: settings.color1,
          centerTitle: true,
          elevation: 1.0,
          title: Text('MamieApp'),
          leading: IconButton(
            icon: const Icon(Icons.settings_applications),
            tooltip: 'Settings',
            onPressed: () {
              navigateToSettingPage(context);
            },
          ),
          actions: <Widget>[
            ChangeFamillyButton(),
          ],
        ),
        body: Stack(
            children: <Widget>[
              //Test(),
              MyGoogleMap(),
              ListMembre(),
              MembreDetail(),
            ]
        )
      )
    );
  }
}
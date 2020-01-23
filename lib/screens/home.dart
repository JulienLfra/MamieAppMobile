import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mamieapp/api/api.dart';
import 'package:mamieapp/models/user.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/widgets/test.dart';
import '../widgets/map.dart';
import '../widgets/memberDetailCard.dart';
import '../widgets/membersListView.dart';
import '../widgets/familiesDropDownButton.dart';
import '../models/family.dart';
import 'messageHome.dart';
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

  Family family = new Family("0", "InitFamily");
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

  User user;

  Home(this.user);

  @override
  HomeState createState() => new HomeState(user);
}

//---
class HomeState extends State<Home> {

  HomeState(this.userLogged);

  Future navigateToSettingPage(context) async {
    Navigator.push(
      context, MaterialPageRoute(
        builder: (context) => Settings(),
        settings: RouteSettings(
          arguments: userLogged
        )
      )
    );
  }

  Future navigateToMessagePage(context) async {
    Navigator.push(
      context, MaterialPageRoute(
        builder: (context) => Message()
      )
    );
  }

  var tabUser = new List<User>();
  User userLogged;

  @override
  void initState() {
    super.initState();
    //User user = ModalRoute.of(context).settings.arguments;
    API.getUserByMail(userLogged.mail).then((response) {
      Iterable list = json.decode(response.body);
      tabUser = list.map((model) => User.fromJson(model)).toList();
      userLogged = tabUser[0];
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
          title: Text(userLogged.prenom+" "+userLogged.nom),
          leading: IconButton(
            icon: const Icon(Icons.settings_applications),
            tooltip: 'Settings',
            onPressed: () {
              navigateToSettingPage(context);
            },
          ),
          actions: <Widget>[
            ChangeFamillyButton(userLogged),
            IconButton(
              icon: const Icon(Icons.chat_bubble),
              tooltip: 'Chat',
              onPressed: () {
                navigateToMessagePage(context);
              },
            )
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
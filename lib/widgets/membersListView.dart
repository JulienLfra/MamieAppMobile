import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mamieapp/api/api.dart';
import 'package:mamieapp/models/user.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/screens/home.dart';



// List of all contact that we can see the information
class ListMembre extends StatefulWidget {

  @override
  _ListMembre createState() => new _ListMembre();
}

class _ListMembre extends State<ListMembre> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return _myListView(context, state);
  }
}

List<User> users;

Widget _myListView(BuildContext context, MyInheritedWidgetState state) {
  return FutureBuilder<Response>(
    future: API.getMembersByFamilyId(state.family.id)..then((value) {
      // Run the code here using the value
      Iterable list = json.decode(value.body);
      users = list.map((model) => User.fromJson(model)).toList();
      if(state.users.length == 1 && users.length != 0)state.setUsers(users);
    }),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        Iterable list = json.decode(snapshot.data.body);
        users = list.map((model) => User.fromJson(model)).toList();


        // After build send Users to map
//        WidgetsBinding.instance.addPostFrameCallback((_) => onAfterBuild(context, users));
        //return Container();
        return buildMenu(context, users, state);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      // By default, show a loading spinner.
      return CircularProgressIndicator();
    },
  );
}

onAfterBuild(context, List<User> users){
  final MyInheritedWidgetState state = MyInheritedWidget.of(context);
  if(state.users.length == 1)state.setUsers(users);
}

Widget buildMenu(BuildContext context, users, MyInheritedWidgetState state) {
  // Global settings
  GlobalSettings settings = new GlobalSettings();
  return FractionallySizedBox(
    widthFactor: 0.33,
    heightFactor: 0.8,
  child: ListView.builder(
    itemCount: users.length,
    itemBuilder: (context, index) {
      return Stack(
        children: <Widget>[
          Card(
            //color: Color(0xfff1e8e2),
            child: InkWell(
              onTap: () {
                state.selectUser(users[index]);
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(users[index].photo),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              users[index].nom,
                              style: TextStyle(color: settings.color1, fontWeight: FontWeight.bold),
                            )
                          ),
                          Center(
                            child: Text(
                              users[index].prenom,
                              style: TextStyle(color: settings.color4),
                            )
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
            )
          ),
        ]
      );
    },
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    )
  );
}
import 'package:flutter/material.dart';
import 'package:mamieapp/api/uploadPhoto.dart';
import 'package:mamieapp/models/user.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/widgets/membersListView.dart';

import '../models/event.dart';

class EventDetail extends StatefulWidget {
  @override
  _EventDetail createState() => _EventDetail();
}

class _EventDetail extends State<EventDetail> {
  GlobalSettings settings = new GlobalSettings();

  @override
  Widget build(BuildContext context) {
    Event event = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.color1,
        centerTitle: true,
        elevation: 1.0,
        title: Text('Event Detail'),
      ),
      body: Center(
        child: Stack(children: <Widget>[
          Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(event.photo),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Text(
                        event.nom,

                        //style: TextStyle(color: settings.color1, fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Text(
                        event.date,
                        //style: TextStyle(color: settings.color4),
                      )),
                      Center(
                          child: Text(
                        event.lieu,
                        //style: TextStyle(color: settings.color4),
                      )),
                    ],
                  ),
                )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

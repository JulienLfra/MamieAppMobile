import 'package:flutter/material.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import '../widgets/EvenementListView.dart';


class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Global settings
    GlobalSettings settings = new GlobalSettings();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.color1,
        centerTitle: true,
        elevation: 1.0,
        title: Text('Evenement'),
      ),
      body:

        Stack(

            children: <Widget>[


            ListEvenement(),

        ]

      ),
    );
  }
}
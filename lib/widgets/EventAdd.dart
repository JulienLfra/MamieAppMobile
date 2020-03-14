import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mamieapp/api/uploadPhoto.dart';
import 'package:mamieapp/models/user.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/widgets/membersListView.dart';

import '../api/api.dart';
import '../models/event.dart';


class EventAdd extends StatefulWidget {
  @override
  _EventAdd createState() => _EventAdd();
}

class _EventAdd extends State<EventAdd> {

  GlobalSettings settings = new GlobalSettings();

  final nomController = TextEditingController();
  final dateController = TextEditingController();
  final lieuController = TextEditingController();
  final photoController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    Event tempEvent;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.color1,
        centerTitle: true,
        elevation: 1.0,
        title: Text('Add Event'),
      ),
      body:
      ListView(
        children: <Widget>[

          Row(

            children: <Widget>[
              Container(
                height: 40,
                child:  Text(
                    "Ajouter un nouvelle evenement",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,

                    )
                ),
              ),



            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                //height: 30,
                child: Text(
                    "Nom",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
              ),
              Flexible(
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "nom"
                    ),
                    controller: nomController,
                  ),
                ),
              ),
            ],
          ),


          Row(
            children: <Widget>[
              Flexible(
                //height: 30,
                child: Text(
                    "Date",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
              ),
              Flexible(
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Date"
                    ),
                    controller: dateController,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              Flexible(
                //height: 30,
                child: Text(
                    "lieu",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
              ),
              Flexible(
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "lieu"
                    ),
                    controller: lieuController,
                  ),
                ),
              ),
            ],
          ),


          Row(
            children: <Widget>[
              Flexible(
                //height: 30,
                child: Text(
                    "Photo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
              ),
              Flexible(
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "photo"
                    ),
                    controller: photoController,
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () async {

          //Add the changes to the temp user



          if (nomController.text =="") {
            //nothing to do
          }
          else {
            tempEvent.nom =nomController.text;
          }
          if (dateController.text =="") {
            //nothing to do
          }
          else {
            tempEvent.date =dateController.text;
          }
          if (lieuController.text =="") {
            //nothing to do
          }
          else {
            tempEvent.lieu =lieuController.text;
          }
          if (photoController.text =="") {
            //nothing to do
          }
          else {
            tempEvent.photo =photoController.text;
          }




          //put tempUser
          print("send 0");
          String userEncoded  = json.encode(tempEvent);
          print("send 0,1");


          //API().setUserByMail(tempEvent.mail, body: userEncoded);
          //tabUser = list.map((model) => User2.fromJson(model)).toList();

        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.save),
      ),

    );
  }
}
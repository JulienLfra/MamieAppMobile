import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mamieapp/api/uploadPhoto.dart';
import 'package:mamieapp/models/user.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/widgets/membersListView.dart';

import 'package:google_maps_webservice/places.dart';
import 'package:geolocator/geolocator.dart';

import '../api/api.dart';
import '../models/event.dart';

class EventAdd extends StatefulWidget {
  @override
  _EventAdd createState() => _EventAdd();
}

class _EventAdd extends State<EventAdd> {
  bool Placefind = false;

  final places =
      new GoogleMapsPlaces(apiKey: "AIzaSyDLCcBFBb4Ke43GIF4MwPAUCcBOwpRNu2A");

  GlobalSettings settings = new GlobalSettings();

  final nomController = TextEditingController();
  final dateController = TextEditingController();
  final lieuController = TextEditingController();
  final photoController = TextEditingController();

//  PlacesSearchResult dropdownValue;
//  List<PlacesSearchResult> placesList;
  var placesList = new List<PlacesSearchResult>();
  String selectedPlace = "choose a place";

//  getPlacesAroundMe() async {
//    var currentLocation = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
//    PlacesSearchResponse reponse = await places.searchNearbyWithRadius(new Location(currentLocation.latitude, currentLocation.longitude), 500);
//    setState(() {
//      placesList = reponse.results;
//    });
//  }
  getPlacesAroundMe() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    PlacesSearchResponse reponse = await places.searchNearbyWithRadius(
        new Location(position.latitude, position.longitude), 500);
    return reponse;
  }

  _listingEvent(list) {
    print(list.results[0]);
    int start = 0;
    List<String> listPlace = new List();

    for (int i = 0; i < list.results.length; i++) {
      listPlace.add(list.results[i].name);
    }

    return new DropdownButton<String>(
      hint: Text(selectedPlace),
      onChanged: (newVal) {
        setState(() {
          selectedPlace = newVal;
        });
      },
      items: listPlace.map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),

      //onChanged: (newVal) { selectedPlace = newVal;
      // print(selectedPlace);
      // },
    );

    /*return Column(
      children: <Widget>[
        SizedBox(
          height: 400, // fixed height
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: list.results.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: Center(child: Text(' ${list.results[index].name}')),
                );
              }
          ),
        ),
      ],
    );*/
  }

  @override
  Widget build(BuildContext context) {
    Event tempEvent = new Event(1, "", "", "", "", "");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.color1,
        centerTitle: true,
        elevation: 1.0,
        title: Text('Add Event'),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 40,
                child: Text("Ajouter un nouvelle evenement",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                //height: 30,
                child: Text("Nom",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: "nom"),
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
                child: Text("Date",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Date"),
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
                child: Text("Lieu   ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              FutureBuilder(
                future: getPlacesAroundMe(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    return _listingEvent(snapshot.data);
                  else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                //height: 30,
                child: Text("Photo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: "photo"),
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

          if (nomController.text == "") {
            //nothing to do
          } else {
            print(nomController);
            tempEvent.nom = nomController.text;
          }
          if (dateController.text == "") {
            //nothing to do
          } else {
            tempEvent.date = dateController.text;
          }
          if (lieuController.text == "") {
            tempEvent.lieu = selectedPlace;
            //nothing to do
          } else {
            tempEvent.lieu = selectedPlace;
          }
          if (photoController.text == "") {
            //nothing to do
          } else {
            tempEvent.photo = photoController.text;
          }

          //put tempUser

          print("id");
          print(tempEvent.id);
          print("nom");
          print(tempEvent.nom);
          print("date");
          print(tempEvent.date);
          print("lieu");
          print(tempEvent.lieu);
          print("photo");
          print(tempEvent.photo);
          print("famille");
          print(tempEvent.famille);
          String tempEncoded = json.encode(tempEvent);

          API().setEvent(tempEncoded);
          //tabUser = list.map((model) => User2.fromJson(model)).toList();
        },
        tooltip: 'Show me the  value!',
        child: Icon(Icons.save),
      ),
    );
  }
}

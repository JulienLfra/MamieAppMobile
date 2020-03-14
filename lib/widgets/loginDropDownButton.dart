import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mamieapp/api/api.dart';
import 'package:mamieapp/models/family.dart';
import 'package:mamieapp/models/user.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/screens/home.dart';

///////////
import 'package:google_maps_webservice/places.dart';

class LoginButton extends StatefulWidget {
  //LoginButton({Key key}) : super(key: key);

  @override
  _LoginButton createState() => _LoginButton();
}

class _LoginButton extends State<LoginButton> {

  ////////////////
  final places = new GoogleMapsPlaces(apiKey: "AIzaSyDLCcBFBb4Ke43GIF4MwPAUCcBOwpRNu2A");

  // Todo : Connecter ca a la bonn epage de julien
  Future<void> test() async {
    PlacesSearchResponse reponse = await places.searchNearbyWithRadius(new Location(43.534551, 6.462102), 500);
    print("Hey");
    print(reponse.results[2].name);
  }

  // Global settings
  GlobalSettings settings = new GlobalSettings();

  // Famille selectionné
  User user;

  // List initialisé a vide
  var users = new List<User>();

  Future navigateToHomePage(context) async {
    Navigator.push(
        context, MaterialPageRoute(
        builder: (context) => Home(user),
        settings: RouteSettings(
            arguments: user
        )
    )
    );
  }

  // Si j'ai bien compris
  _getUsers() {
    test();
    if(users.isEmpty == false){
      return DropdownButton<User>(
        value: user,
        isDense: true,
        style: TextStyle(color: settings.color2),
        onChanged: (User newValue) {
          // Important
          setState(() {
            // Local state -> Actualise le button
            user = newValue;
          });
          navigateToHomePage(context);
        },
        items: users
            .map<DropdownMenuItem<User>>((User value) {
          return DropdownMenuItem<User>(
            value: value,
            child: Text(
              value.prenom+" "+value.nom,
            ),
          );
        }).toList(),
      );
    } else {
      // Recup du Json
      //API.getFamilies().then((response) {
      API.getUsers().then((response) {
        // Le setState enregistre les variables dont famillies qui ne sera plus vide dans le if
        // Todo Comment le build sait qu'il y a un changement ?
        setState(() {
          Iterable list = json.decode(response.body);
          users = list.map((model) => User.fromJson(model)).toList();
          user = users[0];
        });
      });
      return Container(
          //child: Text("Pas de Users, verifiez la connexion")
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Pas de Users, verifiez la connexion"),
              FloatingActionButton(
                child: Icon(Icons.autorenew),
                onPressed: (){
                  setState(() {

                  });
                },
              )
            ],
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getUsers();
  }
}
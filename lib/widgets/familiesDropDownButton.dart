import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mamieapp/api/api.dart';
import 'package:mamieapp/models/family.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/screens/home.dart';

class ChangeFamillyButton extends StatefulWidget {
  ChangeFamillyButton({Key key}) : super(key: key);
  
  @override
  _ChangeFamillyButtonState createState() => _ChangeFamillyButtonState();
}

class _ChangeFamillyButtonState extends State<ChangeFamillyButton> {

  // Global settings
  GlobalSettings settings = new GlobalSettings();

  // Famille selectionné
  Family family;

  // List initialisé a vide
  var families = new List<Family>();

  // Si j'ai bien compris
  _getFamilies(state) {
    if(families.isEmpty == false){
      return DropdownButton<Family>(
        value: family,
        isDense: true,
        style: TextStyle(color: settings.color2),
        onChanged: (Family newValue) {
          // Important
          setState(() {
            // Local state -> Actualise le button
            family = newValue;
            // Global state
            // Todo change name  : addItem
            state.selectFamily(family);
          });
        },
        items: families
            .map<DropdownMenuItem<Family>>((Family value) {
          return DropdownMenuItem<Family>(
            value: value,
            child: Text(
              value.family_name,
            ),
          );
        }).toList(),
      );
    } else {
      // Recup du Json
      API.getFamilies().then((response) {
        // Le setState enregistre les variables dont famillies qui ne sera plus vide dans le if
        // Todo Comment le build sait qu'il y a un changement ?
        setState(() {
          Iterable list = json.decode(response.body);
          families = list.map((model) => Family.fromJson(model)).toList();
          family = families[0];
        });
        state.selectFamily(families[0]);
      });
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {

    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return _getFamilies(state);
  }
}
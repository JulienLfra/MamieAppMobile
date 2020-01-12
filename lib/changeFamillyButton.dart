import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mamieapp/api/api.dart';
import 'package:mamieapp/models/family.dart';

class ChangeFamillyButton extends StatefulWidget {
  ChangeFamillyButton({Key key}) : super(key: key);

  @override
  _ChangeFamillyButtonState createState() => _ChangeFamillyButtonState();
}

class _ChangeFamillyButtonState extends State<ChangeFamillyButton> {
  // Famille selectionné
  String dropdownValue;

  // List initialisé a vide
  var families = new List<Family>();

  // Si j'ai bien compris
  _getFamilies() {
    if(families.isEmpty == false){
      return DropdownButton<String>(
        value: dropdownValue,
        style: TextStyle(color: Colors.blue),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: families
            .map<DropdownMenuItem<String>>((Family value) {
          return DropdownMenuItem<String>(
            value: value.family_name,
            child: Text(value.family_name),
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
          dropdownValue = families[0].family_name;
        });
      });
      return Container();
    }

  }

  initState() {
    super.initState();
    _getFamilies();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return _getFamilies();
  }
}
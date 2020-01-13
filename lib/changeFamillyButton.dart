import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mamieapp/api/api.dart';
import 'package:mamieapp/models/family.dart';
import 'package:mamieapp/redux/actions.dart';

import 'HomeState.dart';

class ChangeFamillyButton extends StatefulWidget {
  ChangeFamillyButton({Key key}) : super(key: key);

  @override
  _ChangeFamillyButtonState createState() => _ChangeFamillyButtonState();
}

class _ChangeFamillyButtonState extends State<ChangeFamillyButton> {
  // Famille selectionné
  Family dropdownValue;

  // List initialisé a vide
  var families = new List<Family>();

  // Si j'ai bien compris
  _getFamilies() {
    if(families.isEmpty == false){
      return StoreConnector<HomeState, VoidCallback>(
        converter: (store) {
          // Return a `VoidCallback`, which is a fancy name for a function
          // with no parameters. It only dispatches an Increment action.
          //return () => store.dispatch(ActionsTest.Increment);
          return () => store.dispatch(FamilyChanged(dropdownValue));
        },
        builder: (context, callback) {

          return DropdownButton<Family>(
            value: dropdownValue,
            style: TextStyle(color: Colors.blue),
            onChanged: (Family newValue) {
              // Important
              callback();
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: families
                .map<DropdownMenuItem<Family>>((Family value) {
              return DropdownMenuItem<Family>(
                value: value,
                child: Text(value.family_name),
              );
            }).toList(),
          );
        }
      );
    } else {
      // Recup du Json
      API.getFamilies().then((response) {
        // Le setState enregistre les variables dont famillies qui ne sera plus vide dans le if
        // Todo Comment le build sait qu'il y a un changement ?
        setState(() {
          Iterable list = json.decode(response.body);
          families = list.map((model) => Family.fromJson(model)).toList();
          dropdownValue = families[0];
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
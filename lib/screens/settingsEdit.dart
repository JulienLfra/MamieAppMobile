

import 'package:flutter/material.dart';


class EditSettings extends StatelessWidget {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xfff8faf8),
        centerTitle: true,
        elevation: 1.0,
        title: Text('Edit Settings'),
      ),
      body:

      Column(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 70,
                      child: Center(
                        child: Text(
                            "RGPD",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                    ),


                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: FlatButton.icon(

                        color: Colors.green,
                        icon: Icon(Icons.system_update_alt),
                        label: Text('Télécharger mes données'),
                        onPressed: () {

                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: FlatButton.icon(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        label: Text(
                            'Demander la suppression de mes données'),
                        onPressed: () {

                        },
                      ),

                    ),
                  ]
                ),
                //////////////// fin section RGP

                ///////////////// Début fonction
                Column(
                  children: <Widget>[
                    Container(
                      height: 70,
                      child: Center(
                        child: Text(
                            "Fonctions",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                    ),
                    Row(

                      children: <Widget>[
                        Center(
                          child: Text(
                              "Fonctions 1",
                              textAlign: TextAlign.center,
                              style: TextStyle(

                                fontSize: 20,

                              )
                          ),

                        ),
                        SwitchWidget(),
                      ],
                    ),

                    Row(

                      children: <Widget>[
                        Center(
                          child: Text(
                              "Fonctions 2",
                              textAlign: TextAlign.center,
                              style: TextStyle(

                                fontSize: 20,

                              )
                          ),

                        ),
                        SwitchWidget(),
                      ],
                    ),
                    Row(

                      children: <Widget>[
                        Center(
                          child: Text(
                              "Fonctions 3",
                              textAlign: TextAlign.center,
                              style: TextStyle(

                                fontSize: 20,

                              )
                          ),

                        ),
                        SwitchWidget(),
                      ],
                    ),
                  ],
                ),
              ]
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text("save"),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.save),
      ),
    );
  }
}

class SwitchWidget extends StatefulWidget {
  @override
  SwitchWidgetClass createState() => new SwitchWidgetClass();
}

class SwitchWidgetClass extends State {

  bool switchControl = false;
  var textHolder = 'Switch is OFF';

  void toggleSwitch(bool value) {

    if(switchControl == false)
    {
      setState(() {
        switchControl = true;
        textHolder = 'Switch is ON';
      });
    }
    else
    {
      setState(() {
        switchControl = false;
        textHolder = 'Switch is OFF';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ Transform.scale(
            scale: 1.5,
            child: Switch(
              onChanged: toggleSwitch,
              value: switchControl,
              activeColor: Colors.blue,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
            )
        ),
      ]
    );
  }
}
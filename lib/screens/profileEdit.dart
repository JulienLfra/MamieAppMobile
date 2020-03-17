// Todo -> Widget ??

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mamieapp/api/uploadPhoto.dart';
import 'package:mamieapp/models/user.dart';
import 'package:mamieapp/api/api.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/widgets/membersListView.dart';

class EditProfil extends StatefulWidget {
  @override
  _EditProfilState createState() => _EditProfilState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _EditProfilState extends State<EditProfil> {

  GlobalSettings settings = new GlobalSettings();

  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  final idController = TextEditingController();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final mailController = TextEditingController();
  final dateDeNaissanceController = TextEditingController();
  final villeController = TextEditingController();
  final paysController = TextEditingController();
  final photoController = TextEditingController();
  final professionController = TextEditingController();
  final diplomeController = TextEditingController();
  final statutController = TextEditingController();
  final ageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    User user = ModalRoute
        .of(context)
        .settings
        .arguments;
    //print(user.statut);
    User tempUser =user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.color1,
        centerTitle: true,
        elevation: 1.0,
        title: Text('Edit profile'),
      ),
      body:
      ListView(
                children: <Widget>[
          Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: Container(
                    ),
                  ),
                  Positioned(

                    left: 10,
                    top: .0,
                    bottom: .0,

                    child: Center(
                      child: CircleAvatar(
                        radius: 35.0,

                        backgroundImage: NetworkImage(user.photo),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(

            children: <Widget>[
              Container(
                height: 40,
                child:  Text(
                    "A propos de moi",
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
                            "Prénom",
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
                                hintText: user.prenom
                            ),
                            controller: prenomController,
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
                            hintText: user.nom
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
                        "mail",
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
                            hintText: user.mail
                        ),
                        controller: mailController,
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
                            "Statut",
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
                                hintText: user.statut
                            ),
                            controller: statutController,
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
                        "Date de naissance",
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
                            hintText: user.dateDeNaissance
                        ),
                        controller: dateDeNaissanceController,
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
                            "Age",
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
                                hintText: user.age.toString()
                            ),
                            controller: ageController,
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
                            "Pays",
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
                                hintText: user.pays
                            ),
                            controller: paysController,
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
                        "Ville",
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
                            hintText: user.ville
                        ),
                        controller: villeController,
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
                        "Profession",
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
                            hintText: user.profession
                        ),
                        controller: professionController,
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
                            "Diplôme",
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
                                hintText: user.diplome
                            ),
                            controller: diplomeController,
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


          if (prenomController.text =="") {
              //nothing to do
            }
          else {
            tempUser.prenom =prenomController.text;
            }
          if (nomController.text =="") {
            //nothing to do
          }
          else {
            tempUser.nom =nomController.text;
          }
          if (mailController.text =="") {
            //nothing to do
          }
          else {
            tempUser.mail =mailController.text;
          }
          if (dateDeNaissanceController.text =="") {
            //nothing to do
          }
          else {
            tempUser.dateDeNaissance =dateDeNaissanceController.text;
          }
          if (villeController.text =="") {
            //nothing to do
          }
          else {
            tempUser.ville =villeController.text;
          }
          if (paysController.text =="") {
            //nothing to do
          }
          else {
            tempUser.pays =paysController.text;
          }

          if (photoController.text =="") {
            //nothing to do
          }
          else {
            tempUser.photo =photoController.text;
          }

          if (professionController.text =="") {
            //nothing to do
          }
          else {
            tempUser.profession =professionController.text;
          }

          if (diplomeController.text =="") {
            //nothing to do
          }
          else {
            tempUser.diplome =diplomeController.text;
          }

          if (statutController.text =="") {
            //nothing to do
          }
          else {
            tempUser.statut =statutController.text;
          }

          if (ageController.text =="") {
            //nothing to do
          }
          else {
            tempUser.age =int.parse(ageController.text);
          }



          //put tempUser
          print("send 0");
          print(tempUser.prenom);
          String userEncoded  = json.encode(tempUser);
          print("send 0,1");


         API().setUserByMail(tempUser.mail, body: userEncoded);
          //tabUser = list.map((model) => User2.fromJson(model)).toList();

        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.save),
      ),
    );
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    prenomController.dispose();
    super.dispose();
  }
}

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mamieapp/EditSettings.dart';
import 'package:mamieapp/EditProfil.dart';
import 'package:mamieapp/ManagePicture.dart';


class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xfff8faf8),
        centerTitle: true,
        elevation: 1.0,
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

              Stack(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: Container(
                    ),
                   ),
                    Positioned(

                      left: .0,
                      top: .0,
                      bottom: .0,
                      right: .0,
                      child: Center(
                        child: CircleAvatar(
                        radius: 110.0,

                        backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2019/11/23/05/06/happy-4646299_1280.jpg"),
                        ),
                      ),
                    )
                  ],
              ),


            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            RawMaterialButton(

                              onPressed: () {
                                navigateToEditSettingPage(context);
                              },
                              child: new Icon(
                                Icons.settings,
                                color: Colors.grey,
                                size: 70.0,
                              ),

                              shape: new CircleBorder(),
                              elevation: 2.0,
                              fillColor: Colors.white,
                              padding: const EdgeInsets.all(15.0),
                            ),

                            Text("Edit settings"),

                          ],
                        ),
                        Column(
                          children: <Widget>[
                            RawMaterialButton(


                              onPressed: () {
                                navigateToEditProfilePage(context);
                              },
                              child: new Icon(
                                Icons.edit,
                                color: Colors.grey,
                                size: 70.0,
                              ),

                              shape: new CircleBorder(),
                              elevation: 2.0,
                              fillColor: Colors.white,
                              padding: const EdgeInsets.all(15.0),
                            ),

                            Text("Edit profil"),

                          ],
                        ),
                      ],



                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        RawMaterialButton(


                          onPressed: () {
                            navigateToManagePicturePage(context);
                          },
                          child: new Icon(
                            Icons.photo_camera,
                            color: Colors.grey,
                            size: 70.0,
                          ),

                          shape: new CircleBorder(),
                          elevation: 2.0,
                          fillColor: Colors.white,
                          padding: const EdgeInsets.all(15.0),
                        ),

                        Text("Manage picture"),

                      ],
                    ),
                  ),


                ]


              ),

            ),
        ],
      ),


      ),
    );
  }
  Future navigateToEditSettingPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditSettings()));

  }
  Future navigateToEditProfilePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfil()));

  }
  Future navigateToManagePicturePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ManagePicture()));

  }

}
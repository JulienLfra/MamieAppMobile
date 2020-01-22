import 'package:flutter/material.dart';
import 'package:mamieapp/models/user2.dart';
import 'package:mamieapp/widgets/membersListView.dart';

import 'profileEdit.dart';
import 'settingsEdit.dart';
import 'thumbnailManager.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    User2 user = ModalRoute.of(context).settings.arguments;
    print(user.statut);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff19203f),
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
                      backgroundImage: NetworkImage(user.photo),
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
                                  navigateToEditSettingPage(context,user);
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
                                  navigateToEditProfilePage(context,user);
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
  Future navigateToEditSettingPage(context,user) async {
    print(user);
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => EditSettings(),
    settings: RouteSettings(
      arguments: user
    )));
  }
  Future navigateToEditProfilePage(context,user) async {
    print(user);
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => EditProfil(),
        settings: RouteSettings(
        arguments: user
    )));
  }
  Future navigateToManagePicturePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ManagePicture()));
  }
}
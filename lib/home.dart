import 'package:flutter/material.dart';

import 'Settings.dart';
import 'homeModules.dart';
import 'listMembre.dart';
import 'map.dart';
import 'membreDetail.dart';

class Home extends StatelessWidget {

  Future navigateToSettingPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xfff),
        centerTitle: true,
        elevation: 1.0,
        title: Text('Mamie'),
        leading: IconButton(
          icon: const Icon(Icons.settings_applications),
          tooltip: 'Settings',
          onPressed: () {
            navigateToSettingPage(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Map(),
          //HomeModules(),
          ListMembre(),
          MembreDetail(),
        ]
      )
    );
  }
}
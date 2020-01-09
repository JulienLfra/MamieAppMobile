import 'package:flutter/material.dart';

import 'listMembre.dart';
import 'membreDetail.dart';

class HomeModules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return Container(
        child: Column(
      children: <Widget>[
        ListMembre(),
        MembreDetail(),
      ]
    ));*/
    /*return Container(
      child: Row(
        children: <Widget>[
          ListMembre(),
          MembreDetail(),
        ],
      ),
    );*/
    return Container(
      child:Column(
        children: <Widget>[
          Container(
            child: ListMembre()
          ),Container(
            child: MembreDetail()
          )
        ],
      )
    );
  }
}
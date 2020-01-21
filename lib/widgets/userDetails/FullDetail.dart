import 'package:flutter/material.dart';
import 'FullDetailInfoPerso.dart';
import 'FullDetailMap.dart';
import 'FullDetailPhoto.dart';
import 'FullDetailPP.dart';

class FullDetail extends StatefulWidget {
  @override
  _FullDetailState createState() => _FullDetailState();
}

class _FullDetailState extends State<FullDetail> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.


  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xfff8faf8),
        centerTitle: true,
         elevation: 1.0,
        title: Text('Détail'),
      ),
      body: PageView(
        children: <Widget>[

          FullDetailPP(),
          FullDetailPerso(),
          FullDetailMap(),
          FullDetailPhoto(),

        ],
      ),
    );
  }
}
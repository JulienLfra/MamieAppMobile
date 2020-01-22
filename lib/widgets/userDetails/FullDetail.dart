import 'package:flutter/material.dart';
import 'package:mamieapp/screens/home.dart';
import 'FullDetailInfoPerso.dart';
import 'FullDetailMap.dart';
import 'FullDetailPhoto.dart';
import 'FullDetailPP.dart';

class FullDetail extends StatefulWidget {
  @override
  _FullDetailState createState() => _FullDetailState();
}

class _FullDetailState extends State<FullDetail> {

  @override
  Widget build(BuildContext context) {
    // Recup le setting de la page parent : membreDetailCard
    final MyInheritedWidgetState state = ModalRoute.of(context).settings.arguments;

    return MyInheritedWidget(
        child: Scaffold(
          appBar: AppBar(
          backgroundColor: new Color(0xff19203f),
          centerTitle: true,
         elevation: 1.0,
        title: Text('Détail'),
      ),
      body: PageView(
        children: <Widget>[
          FullDetailPP(state.user),
          FullDetailPerso(),
          FullDetailMap(),
          FullDetailPhoto(),

        ],
      ),
    ));
  }
}
import 'package:flutter/material.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/screens/home.dart';

import 'userDetails/FullDetail.dart';

class MembreDetail extends StatefulWidget {
  MembreDetail({Key key}) : super(key: key);

  @override
  _MembreDetailState createState() => _MembreDetailState();
}

class _MembreDetailState extends State<MembreDetail> {

  // Global settings
  GlobalSettings settings = new GlobalSettings();

  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    if(state.user == null){
      return Container();
    }
    return GestureDetector(
      onTap: (){
        navigateToFullDetail(context, state);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
//            height: MediaQuery.of(context).size.height*0.15,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              )+ Border.all(
                color: settings.color2,
              ),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(state.user.photo),
                  ),
                  title: Text(
                    state.user.prenom + " " + state.user.nom,
                    style: TextStyle(color: settings.color1, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(state.user.age.toString()+" ans, "+state.user.profession+" à "+state.user.ville),
                  ),
                ],
              ),
            ),
            //color: Colors.blue,
          ),
        ]
      )
    );
  }
}

Future navigateToFullDetail(context, state) async {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => FullDetail(),
    settings: RouteSettings(
      arguments: state
    )
  ));
}
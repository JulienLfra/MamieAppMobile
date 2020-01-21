import 'package:flutter/material.dart';
import 'package:mamieapp/screens/home.dart';

import 'userDetails/FullDetail.dart';

class MembreDetail extends StatefulWidget {
  MembreDetail({Key key}) : super(key: key);

  @override
  _MembreDetailState createState() => _MembreDetailState();
}

class _MembreDetailState extends State<MembreDetail> {

  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    if(state.user == null){
      return Container();
    }
    return GestureDetector(
      onTap: (){
        navigateToFullDetail(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height*0.2,
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                  leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(state.user.thumbnail),
                  ),

                  title: Text(state.user.firstname + " " + state.user.name),
                  subtitle: Text('Lyon.'),
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

Future navigateToFullDetail(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => FullDetail()));

}
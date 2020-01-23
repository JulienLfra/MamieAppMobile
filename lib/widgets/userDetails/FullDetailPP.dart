import 'package:flutter/material.dart';
import 'package:mamieapp/models/user.dart';

class FullDetailPP extends StatelessWidget {
  User user;

  FullDetailPP(this.user);

  @override
  Widget build(BuildContext context) {
    if(user == null){
      return Text("error");
    }
    return Stack(
      children: <Widget>[
        Positioned(
          top: MediaQuery.of(context).size.height / 50,
          bottom: MediaQuery.of(context).size.height / 50,
          left: .0,
          right: .0,
          child: Column(
            children: <Widget>[
              CircleAvatar(
                // le 2.1 permet le petit margin
                radius: MediaQuery.of(context).size.width / 2.1,
                backgroundImage: NetworkImage(user.photo),
              ),
              Text(
                user.prenom+" "+user.nom,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(user.statut, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pinkAccent)),
              Text(""),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Age : "+user.age.toString()),
                  Text("Habite : "+user.ville+", "+user.pays),
                  Text("Diplome : "+user.diplome),
                  Text("Profession : "+user.profession),
                ],
              )
            ]
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 50,
          left: .0,
          right: .0,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Swipe right"),
                Icon(
                  Icons.navigate_next,
                  color: Colors.pinkAccent,
                  size: 24,
                )
              ],
            )
          ),
        )
      ],
    );
  }
}
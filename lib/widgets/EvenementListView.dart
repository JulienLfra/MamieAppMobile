import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mamieapp/api/api.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/screens/home.dart';
import '../models/event.dart';
import 'package:mamieapp/screens/home.dart';
import 'EventDetail.dart';


// List of all event that we can see the information
class ListEvenement extends StatefulWidget {


  @override
  _ListEvenement createState() => new _ListEvenement();
}
var events =new List<Event>() ;
class _ListEvenement extends State<ListEvenement> {


  @override
  void initState() {
    super.initState();

    API.getEventByMail("ap@gmail.com").then((response) {
      // Le setState enregistre les variables dont famillies qui ne sera plus vide dans le if
      // Todo Comment le build sait qu'il y a un changement ?

        Iterable list = json.decode(response.body);
        events = list.map((model) => Event.fromJson(model)).toList();

    });
  }

  @override
  Widget build(BuildContext context) {


    //final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return _myListView(context);
  }
}




/*Widget _myListView(BuildContext context, MyInheritedWidgetState state) {
  //print(state.family.id);
  // Todo : Appel ajax puis Affichege list

  return FutureBuilder<Response>(

    future: API.getEventByMail("ap@gmail.com"),

    builder: (context, snapshot) {
      if (snapshot.hasData) {
        Iterable list = json.decode(snapshot.data.body);
        events = list.map((model) => Event.fromJson(model)).toList();

        return buildMenu(context, events, state);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      // By default, show a loading spinner.
      return CircularProgressIndicator();
    },
  );
}*/

Widget _myListView(BuildContext context) {
  // Global settings



  if (events.isEmpty == false )
  {
    return Container(

        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return Stack(
                children: <Widget>[
                  Card(
                    //color: Color(0xfff1e8e2),
                      child: InkWell(
                        onTap: () {

                          navigateToSeeEvent(context, (events[index]));
                          //state.selectEvent(events[index]);
                          print("salut2");
                        },
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(events[index].photo),
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                          child: Text(
                                            events[index].nom,

                                            //style: TextStyle(color: settings.color1, fontWeight: FontWeight.bold),
                                          )
                                      ),
                                      Center(
                                          child: Text(
                                            events[index].date,
                                            //style: TextStyle(color: settings.color4),
                                          )
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      )
                  ),
                ]
            );
          },
          scrollDirection: Axis.vertical,
          shrinkWrap: true,

        )


    );


  }
  else {
    API.getEventByMail("ap@gmail.com").then((response) {
      // Le setState enregistre les variables dont famillies qui ne sera plus vide dans le if
      // Todo Comment le build sait qu'il y a un changement ?

        Iterable list = json.decode(response.body);
        events = list.map((model) => Event.fromJson(model)).toList();
        print("List :");
        print(list);
      });


    return Container();
  };

}

Future navigateToSeeEvent(context,event) async {
  Navigator.push(context, MaterialPageRoute(
      builder: (context) => EventDetail(),
      settings: RouteSettings(
          arguments: event
      )));
}
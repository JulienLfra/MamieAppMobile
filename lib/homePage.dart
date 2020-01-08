import 'package:flutter/material.dart';
import 'package:mamie/listContact.dart';




class HomePage extends StatelessWidget {
  final topBar = new AppBar(

    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    title: Text('Mamie'),

  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: topBar,

        body:
        Center(
          child: Column(
            children: <Widget>[

              topThreeButtonsSection ,

              Expanded(
                child: Row(
                  children: <Widget>[

                    Container(
                        child: listContact(),
                      width: 140,

                    ),

                    Expanded(
                      //color: Colors.yellow,
                      child: Container(
                        child: new ListTile(
                          title: new Text(' Google map'),
                        ),
                        color: Colors.yellow,
                        height: 500,

                      ),
                    ),
                  ],
                ),
              ),
              Container(

                child: Card(


                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Text('image'),
                        title: Text('Julien Laurencin'),
                        subtitle: Text('Lyon.'),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('see more'),
                            onPressed: () { print('See more details for the user'); },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              color: Colors.blue,
              height: 150,
              ),

             // Expanded(child: BodyLayout()),


            ]

            ),
        )
        //threeButtonsSection,


    );
  }
}



// Container with buttons setting, message and familly
Widget topThreeButtonsSection = new Container(
  child:  Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      //build in a separated function1A
      FlatButton.icon(
        color: Colors.blue,
        icon: Icon(Icons.settings), //`Icon` to display
        label: Text('Settings'), //`Text` to display
        onPressed: () {
          //Code to execute when Floating Action Button is clicked
          //...
        },
      ),

      FamillyList(),


      FlatButton.icon(
        color: Colors.blue,
        icon: Icon(Icons.message),
        label: Text('Message'),
        onPressed: () {

        },
      ),
    ],
  ),


);


// to add the list of familly that the user can choose
class FamillyList extends StatefulWidget {
  FamillyList({Key key}) : super(key: key);

  @override
  FamillyListState createState() => FamillyListState();
}

class FamillyListState extends State<FamillyList> {
  String dropdownValue = 'Molinet';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(

      icon: Icon(Icons.accessibility_new),
      value: dropdownValue,
      style: TextStyle(color: Colors.black),


      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Molinet', 'Bozon', 'Laurencin', 'Plaideau']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}




import 'package:flutter/material.dart';


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

              threeButtonsSection ,
              Expanded(
                child: Row(
                  children: <Widget>[

                    Expanded(
                        child: BodyLayout()


                    ),

                    Container(
                      color: Colors.yellow,
                      width: 300,

                    ),


                  ],

                ),



              ),
             // Expanded(child: BodyLayout()),


            ]

            ),
        )
        //threeButtonsSection,




//        new ListView(
//
//        children: <Widget>[
//
//          //You can add more widget bellow
//
//          threeButtonsSection ,
//
//
//          BodyLayout(),
//
//
//
//
//
//
//        ],
//        shrinkWrap: true,

//      )
//
    );
  }
}




Widget threeButtonsSection = new Container(
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
        icon: Icon(Icons.message), //`Icon` to display
        label: Text('Message'), //`Text` to display
        onPressed: () {
          //Code to execute when Floating Action Button is clicked
          //...
        },
      ),
    ],
  ),



);

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

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {

  final titles = ['bike', 'boat', 'bus', 'car',
    'railway', 'run', 'subway', 'transit', 'walk', 'boat', 'bus', 'car',
    'railway', 'run', 'subway', 'transit', 'walk'];

  final icons = [Icons.directions_bike, Icons.directions_boat,
    Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
    Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
    Icons.directions_walk];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card( //                           <-- Card widget
          child: InkWell(
            onTap: () {
              print('tapped');
            },
            child: ListTile(

            //leading: Icon(icons[index]),
              title: Text(titles[index]),
            ),
         )
      );
    },
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
  );

}
import 'package:flutter/material.dart';
import 'package:mamie/homePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Mamie',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black),
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.black, fontFamily: "Aveny")),
          textTheme: TextTheme(title: TextStyle(color: Colors.black))),
      home: new HomePage(),
    );
  }
}





//import 'package:flutter/material.dart';
//
//
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Mamie',
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      //home: MyHomePage(title: 'Flutter Demo Home Page'),
//      home: TextAndIconButton(),
//    );
//  }
//}
//
//class TextAndIconButton extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Mamie'),
//      ),
//
//      body:
//     // threeButtonsSection,
//      //BodyLayout(),
//
//
//        new ListView(
//
//        children: <Widget>[
//
//          //You can add more widget bellow
//
//          threeButtonsSection ,
//          //BodyLayout(),
//
//
//
//
//
//
//        ],
//        shrinkWrap: true,
//
//      )
//    );
//  }
//}
//
//class BodyLayout extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return _myListView(context);
//  }
//}
//
//// replace this function with the code in the examples
//Widget _myListView(BuildContext context) {
//
//  // the Expanded widget lets the columns share the space
//  Widget column = Expanded(
//    child: Column(
//      // align the text to the left instead of centered
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Text('Nom', style: TextStyle(fontSize: 16),),
//        Text('Prenom'),
//      ],
//    ),
//  );
//
//  return ListView.builder(
//    //scrollDirection: Axis.vertical,
//    shrinkWrap: true,
//    itemBuilder: (context, index) {
//      return Card(
//        child: InkWell(
//          onTap: () {
//            print('tapped');
//          },
//          child: Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Row(
//              children: <Widget>[
//                column,
//
//              ],
//            ),
//          ),
//        ),
//      );
//    },
//  );
//
//}
//
//
//
//Widget threeButtonsSection = new Container(
//  child: new Row(
//    mainAxisAlignment: MainAxisAlignment.spaceAround,
//    children: <Widget>[
//      //build in a separated function1A
//      FlatButton.icon(
//        color: Colors.blue,
//        icon: Icon(Icons.settings), //`Icon` to display
//        label: Text('Settings'), //`Text` to display
//        onPressed: () {
//          //Code to execute when Floating Action Button is clicked
//          //...
//        },
//      ),
//
//       MyStatefulWidget(),
//
////      FlatButton.icon(
////        color: Colors.blue,
////        icon: Icon(Icons.accessibility_new), //`Icon` to display
////        label: Text('Famille'), //`Text` to display
////        onPressed: () {
////
////
////
////          //Code to execute when Floating Action Button is clicked
////          //...
////        },
////      ),
//
//      FlatButton.icon(
//        color: Colors.blue,
//        icon: Icon(Icons.message), //`Icon` to display
//        label: Text('Message'), //`Text` to display
//        onPressed: () {
//          //Code to execute when Floating Action Button is clicked
//          //...
//        },
//      ),
//    ],
//  ),
//);
//
//class MyStatefulWidget extends StatefulWidget {
//  MyStatefulWidget({Key key}) : super(key: key);
//
//  @override
//  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
//}
//
//class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//  String dropdownValue = 'Molinet';
//
//  @override
//  Widget build(BuildContext context) {
//    return DropdownButton<String>(
//
//      icon: Icon(Icons.accessibility_new),
//      value: dropdownValue,
//      style: TextStyle(color: Colors.black),
//
//
//      onChanged: (String newValue) {
//        setState(() {
//          dropdownValue = newValue;
//        });
//      },
//      items: <String>['Molinet', 'Bozon', 'Laurencin', 'Plaideau']
//          .map<DropdownMenuItem<String>>((String value) {
//        return DropdownMenuItem<String>(
//          value: value,
//          child: Text(value),
//        );
//      }).toList(),
//    );
//  }
//}
//


////class MyApp extends StatelessWidget {
////  //Stateless = immutable = cannot change object's properties
////  //Every UI components are widgets
////  @override
////  Widget build(BuildContext context) {
////    //Now we need multiple widgets into a parent = "Container" widget
////    Widget titleSection = new Container(
////      padding: const EdgeInsets.all(10.0),//Top, Right, Bottom, Left
////      child: new Row(
////        children: <Widget>[
////          new Expanded(
////            child: new Column(
////              crossAxisAlignment: CrossAxisAlignment.start,
////              children: <Widget>[
////
////              ],
////            ),
////          ),
////          //new Icon(Icons.favorite, color: Colors.red),
////          //new Text(" 100", style: new TextStyle(fontSize: 16.0),),
////        ],
////      ),
////    );
////
////
////    Widget buildButton(IconData icon, String buttonTitle) {
////      final Color tintColor = Colors.blue;
////      return new Column(
////        children: <Widget>[
////          new Icon(icon, color: tintColor),
////          new Container(
////            margin: const EdgeInsets.only(top: 5.0),
////            child: new Text(buttonTitle, style: new TextStyle(fontSize: 16.0,
////                fontWeight: FontWeight.w600, color: tintColor),),
////          )
////        ],
////      );
////    }
////    Widget threeButtonsSection = new Container(
////      child: new Row(
////        mainAxisAlignment: MainAxisAlignment.spaceAround,
////        children: <Widget>[
////          //build in a separated function1A
////          buildButton(Icons.settings, "Settings"),
////          buildButton(Icons.accessibility_new, "Famille"),
////          buildButton(Icons.message, "Message"),
////        ],
////      ),
////    );
////
////    Widget listFamille = new ListView.builder(
////        itemBuilder: (context, index) {
////          return Text("$index");
////        },
////    );
////
////    //build function returns a "Widget"
////    return new MaterialApp(
////        title: "",
////        home: new Scaffold(
////            appBar: new AppBar(
////              title: new Text('Flutter App'),
////            ),
////
////
////            //body: listUser()
////            body: new ListView(
////
////              children: <Widget>[
////
////                //You can add more widget bellow
////
////                threeButtonsSection ,
////
////
////
////
////
////              ],
////
////            )
////
////        )
////    );//Widget with "Material design"
////  }
////}
////
////class listUser extends StatelessWidget{
////  @override
////  Widget build(BuildContext context) {
////  final users = ['U1','U2', 'U3','U4','U5','U6','U7'];
////
////    // TODO: implement build
////
////
////    return ListView.builder
////      (
////      itemCount: users.length,
////
////      itemBuilder: (context, index) {
////        return ListTile(
////          title: new Text(users[index]),
////        );
////      },
////    );
////  }
////}

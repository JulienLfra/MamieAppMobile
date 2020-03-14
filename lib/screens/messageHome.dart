import 'package:flutter/material.dart';
import 'package:mamieapp/resources/globalSettings.dart';
import 'package:mamieapp/widgets/EventAdd.dart';
import '../widgets/EvenementListView.dart';


class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Global settings
    GlobalSettings settings = new GlobalSettings();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.color1,
        centerTitle: true,
        elevation: 1.0,
        title: Text('Evenement'),
      ),
      body:
        Center(

            child: Column(
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    navigateToAddEvent(context);
                  },
                  child: new Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 70.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.blue,
                  padding: const EdgeInsets.all(15.0),
                ),
                Text("Add Event"),
                ListEvenement(),
              ],
            ),
      ),

    );
  }
}
Future navigateToAddEvent(context) async {
  Navigator.push(context, MaterialPageRoute(
      builder: (context) => EventAdd(),
      ));
}
// Todo -> Widget ??

import 'package:flutter/material.dart';

class EditProfil extends StatefulWidget {
  @override
  _EditProfilState createState() => _EditProfilState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _EditProfilState extends State<EditProfil> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final myController2 = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xfff8faf8),
        centerTitle: true,
        elevation: 1.0,
        title: Text('Edit profile'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: Container(
                    ),
                  ),
                  Positioned(

                    left: 10,
                    top: .0,
                    bottom: .0,

                    child: Center(
                      child: CircleAvatar(
                        radius: 35.0,

                        backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2019/11/23/05/06/happy-4646299_1280.jpg"),
                      ),
                    ),
                  )
                ],
              ),
              Container(

                child: FlatButton.icon(
                  icon: Icon(Icons.mode_edit),
                  color: Colors.grey,
                  label: Text(
                      'Modify Picture'),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
          Row(

            children: <Widget>[
              Container(
                height: 40,
                child:  Text(
                    "A propos de moi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),



            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                //height: 30,
                child: Text(
                    "Nom",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
              ),
              Flexible(
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: myController,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                //height: 30,
                child: Text(
                    "Prénom",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
              ),
              Flexible(
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: myController2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),



      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.save),
      ),
    );
  }
}

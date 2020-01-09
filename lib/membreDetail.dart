import 'package:flutter/material.dart';

class MembreDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.2,
      child: Container(
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
    );
  }
}
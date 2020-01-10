import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'HomeState.dart';
import 'models/user.dart';

class MembreDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.25,*/
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: MediaQuery
            .of(context)
            .size
            .height*0.2,
          child: Card(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Todo wtf ???
                StoreConnector<HomeState,HomeState>(
                    converter: (store) => store.state,
                    builder: (context, viewModel) {
                      //return Text(viewModel,style: TextStyle(fontSize: 24));
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(viewModel.user.thumbnail),
                        ),

                        title: Text(viewModel.user.firstname + " " + viewModel.user.name),
                        subtitle: Text('Lyon.'),
                      );
                    }
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
          //color: Colors.blue,
        ),
      ]
    );
  }
}
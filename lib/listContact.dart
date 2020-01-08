import 'package:flutter/material.dart';
import 'package:mamie/JsonTest/users' as usersTest;
import 'dart:convert';


Map<String,dynamic> users = jsonDecode('usersTest');

var name = users['users']['user_name'][0];

// List of all contact that we can see the information
class listContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}



// replace this function with the code in the examples
Widget _myListView(BuildContext context) {



  final titles = [name, 'boat', 'bus', 'car',
    'railway', 'run', 'subway', 'transit', 'walk', 'boat', 'bus', 'car',
    'railway', 'run', 'subway', 'transit', 'walk'];



  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card( //                           <-- Card widget
          child: InkWell(
            onTap: () {
              DisplayContactCard();

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

DisplayContactCard(){
  print('tapped');

}
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mamieapp/redux/actions.dart';

import 'dart:convert';

import 'HomeState.dart';
import 'models/user.dart';


// List of all contact that we can see the information
class ListMembre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  // Fake data Json
  String usersTest = '{"users":[{"user_id":1,"user_name":"Molinet","user_firstname":"Benjamin","user_email":"benjamin.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"BM","user_thumbnail":"https://cdn.pixabay.com/photo/2019/11/23/05/06/happy-4646299_1280.jpg"},{"user_id":2,"user_name":"Molinet","user_firstname":"Benoit","user_email":"benoit.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"BM","user_thumbnail":"https://cdn.pixabay.com/photo/2015/02/09/20/03/koala-630117_1280.jpg"},{"user_id":3,"user_name":"Molinet","user_firstname":"Charlotte","user_email":"charlotte.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"CM","user_thumbnail":"https://cdn.pixabay.com/photo/2019/12/24/08/21/girl-4716186_1280.jpg"},{"user_id":4,"user_name":"Plaideau","user_firstname":"Guillaume","user_email":"guillaume.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"GP","user_thumbnail":"https://cdn.pixabay.com/photo/2019/12/29/14/57/link-4727273_1280.jpg"},{"user_id":5,"user_name":"Mary","user_firstname":"Anne","user_email":"anne.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"AM","user_thumbnail":"https://cdn.pixabay.com/photo/2020/01/05/10/52/collared-kingfisher-4742836_1280.jpg"},{"user_id":6,"user_name":"Mary","user_firstname":"Anne","user_email":"anne.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"AM","user_thumbnail":"https://cdn.pixabay.com/photo/2020/01/05/10/52/collared-kingfisher-4742836_1280.jpg"},{"user_id":7,"user_name":"Bozon","user_firstname":"Guillaume","user_email":"anne.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"AM","user_thumbnail":"https://cdn.pixabay.com/photo/2020/01/05/10/52/collared-kingfisher-4742836_1280.jpg"}]}';
  print(usersTest);
  Map<String,dynamic> user = jsonDecode(usersTest);

  /*

  FractionallySizedBox(
    widthFactor: 0.33,
    heightFactor: 0.8,
    child: Container(
      // Debug
      color: Colors.red,
      width: 90,
      height: 90,
      child: ListContact(),
    ),
  )

  */


  return FractionallySizedBox(
    widthFactor: 0.33,
    heightFactor: 0.8,
    child: Container(
      // Debug
      color: Colors.red,
      child: ListView.builder(
        itemCount: user['users'].length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Card(
              // Todo ca marche presque ca
              child: StoreConnector<HomeState, VoidCallback>(
                converter: (store) {
                  // Return a `VoidCallback`, which is a fancy name for a function
                  // with no parameters. It only dispatches an Increment action.
                  return () => store.dispatch(ActionsTest.Increment);
                  //return () => store.dispatch(Taped(user['users'][index]));
                },
                builder: (context, callback) {
                  return new InkWell(
                    onTap: callback,
                    child: ListTile(
                      title: Text(user['users'][index]['user_name'], textAlign: TextAlign.right),
                      subtitle: Text(user['users'][index]['user_firstname'], textAlign: TextAlign.right),
                      leading: CircleAvatar(
                        radius: 15.0,
                        backgroundImage: NetworkImage(user['users'][index]['user_thumbnail']),
                      ),
                    ),
                  );
                },
              ),

                //child: InkWell(
                /*child: InkWell(
                  onTap: () {

                    // Todo change this to object en mieux
                    DisplayContactCard(context, new User(user['users'][index]['user_name'],user['users'][index]['user_firstname'],user['users'][index]['user_thumbnail']));
                  },
                  child: ListTile(
                    title: Text(user['users'][index]['user_name'], textAlign: TextAlign.right),
                    subtitle: Text(user['users'][index]['user_firstname'], textAlign: TextAlign.right),
                    leading: CircleAvatar(
                      radius: 15.0,
                      backgroundImage: NetworkImage(user['users'][index]['user_thumbnail']),
                    ),
                  ),
                )
              ),*/






              )],
          );
        },
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
      ),
    ),
  );
}

DisplayContactCard(context, user){
  print('tapped');
}

typedef OnSaveCallback = void Function();
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
  // Todo Bug ? Le premier click sur la famille n'actualise pas la list
  // Fake data
//  // Fake data Json
//  String usersTest = '[{"user_id":1,"user_name":"Molinet","user_firstname":"Benjamin","user_email":"benjamin.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"BM","user_thumbnail":"https://cdn.pixabay.com/photo/2019/11/23/05/06/happy-4646299_1280.jpg"},{"user_id":2,"user_name":"Molinet","user_firstname":"Benoit","user_email":"benoit.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"BM","user_thumbnail":"https://cdn.pixabay.com/photo/2015/02/09/20/03/koala-630117_1280.jpg"},{"user_id":3,"user_name":"Molinet","user_firstname":"Charlotte","user_email":"charlotte.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"CM","user_thumbnail":"https://cdn.pixabay.com/photo/2019/12/24/08/21/girl-4716186_1280.jpg"},{"user_id":4,"user_name":"Plaideau","user_firstname":"Guillaume","user_email":"guillaume.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"GP","user_thumbnail":"https://cdn.pixabay.com/photo/2019/12/29/14/57/link-4727273_1280.jpg"},{"user_id":5,"user_name":"Mary","user_firstname":"Anne","user_email":"anne.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"AM","user_thumbnail":"https://cdn.pixabay.com/photo/2020/01/05/10/52/collared-kingfisher-4742836_1280.jpg"},{"user_id":6,"user_name":"Mary","user_firstname":"Anne","user_email":"anne.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"AM","user_thumbnail":"https://cdn.pixabay.com/photo/2020/01/05/10/52/collared-kingfisher-4742836_1280.jpg"},{"user_id":7,"user_name":"Bozon","user_firstname":"Guillaume","user_email":"anne.molinet@cpe.fr","user_birthday":"1578477911","user_initials":"AM","user_thumbnail":"https://cdn.pixabay.com/photo/2020/01/05/10/52/collared-kingfisher-4742836_1280.jpg"}]';
//  //print(usersTest);
//  //Map<String,dynamic> user = jsonDecode(usersTest);
//  Iterable list = json.decode(usersTest);
//  List<User> users = list.map((model) => User.fromJson(model)).toList();

  return FractionallySizedBox(
    widthFactor: 0.33,
    heightFactor: 0.8,
    child: Container(
      child: StoreConnector<HomeState,HomeState>(
        converter: (store) => store.state,
        builder: (context, viewModel) {
          return ListView.builder(
            itemCount: viewModel.menu.length,
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Card(
                    child: StoreConnector<HomeState, VoidCallback>(
                      converter: (store) {
                        return () => store.dispatch(Taped(new User(viewModel.menu[index].name, viewModel.menu[index].firstname, viewModel.menu[index].thumbnail)));
                      },
                      builder: (context, callback) {
                        return new InkWell(
                          onTap: callback,
                          child: ListTile(
                            title: Text(viewModel.menu[index].name, textAlign: TextAlign.right),
                            subtitle: Text(viewModel.menu[index].firstname, textAlign: TextAlign.right),
                            leading: CircleAvatar(
                              radius: 15.0,
                              backgroundImage: NetworkImage(viewModel.menu[index].thumbnail),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
          );
        }
      )
    ),
  );
}
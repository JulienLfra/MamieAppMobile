import 'package:flutter/material.dart';
import 'package:mamieapp/screens/home.dart';

class MembreDetail extends StatefulWidget {
  MembreDetail({Key key}) : super(key: key);

  @override
  _MembreDetailState createState() => _MembreDetailState();
}

class _MembreDetailState extends State<MembreDetail> {

  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    if(state.user == null){
      return Container();
    }
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
                  ListTile(
                  leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(state.user.thumbnail),
                  ),

                  title: Text(state.user.firstname + " " + state.user.name),
                  subtitle: Text('Lyon.'),
                  ),
                  // Todo wtf ???
                  /*StoreConnector<HomeState,HomeState>(
                      converter: (store) => store.state,
                      builder: (context, viewModel) {
                        //return Text(viewModel,style: TextStyle(fontSize: 24));
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(viewModel.userSelected.thumbnail),
                          ),

                          title: Text(viewModel.userSelected.firstname + " " + viewModel.userSelected.name),
                          subtitle: Text('Lyon.'),
                        );
                      }
                  ),*/
                ],
              ),
            ),
            //color: Colors.blue,
          ),
        ]
    );
  }
}
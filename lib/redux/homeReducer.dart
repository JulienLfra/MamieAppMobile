import 'package:flutter/material.dart';
import 'package:mamieapp/models/user.dart';

import '../HomeState.dart';
import 'actions.dart';

HomeState counterReducer(HomeState state, action) {
  /*if (action == ActionsTest.Increment) {
    return HomeState(new User("test2", "test2", state.user.name));
  }

  return state;*/
//    print("reducer");
//    print(action.user.name);
//    print("reducer2");
//    print(state.user.name);

    //return HomeState(userReducer(state, action));
  return HomeState(new User(action.user.name, action.user.firstname, action.user.thumbnail));
}

User userReducer(state, action){
  return new User("test2", "test2", action.user.name);
}
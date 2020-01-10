import 'package:flutter/material.dart';
import 'package:mamieapp/models/user.dart';

import '../HomeState.dart';
import 'actions.dart';

HomeState counterReducer(HomeState state, action) {
  /*if (action == ActionsTest.Increment) {
    return HomeState(new User("test2", "test2", state.user.name));
  }

  return state;*/

  //return HomeState(userReducer(state, action));
  return HomeState(new User("test2", "test2", state.user.name));
}

User userReducer(state, action){
  return new User("test2", "test2", action.user.name);
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mamieapp/api/api.dart';
import 'package:mamieapp/models/user.dart';

import '../HomeState.dart';
import 'actions.dart';

HomeState counterReducer(HomeState state, action) {

  // Todo Faire des fonctions ou des classes
  if(action is Taped){
    state.userSelected = User(action.user.name, action.user.firstname, action.user.thumbnail);
    //return HomeState(new User(action.user.name, action.user.firstname, action.user.thumbnail));
  }
  if(action is FamilyChanged){
    List<User> members;
    API.getMembersByFamilyId(action.family.family_id).then((response) {
      Iterable list = json.decode(response.body);
      members = list.map((model) => User.fromJson(model)).toList();
      state.menu = members;
      // Todo pas ouf ca
      return state;
    });
  }
  return state;
}
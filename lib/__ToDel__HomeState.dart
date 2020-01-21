import 'package:flutter/material.dart';

import 'models/user.dart';

class HomeState {
  User userSelected;
  List<User> menu;

  HomeState(this.userSelected);
  HomeState.fromAppState(HomeState another) {
    userSelected = another.userSelected;
  }
}
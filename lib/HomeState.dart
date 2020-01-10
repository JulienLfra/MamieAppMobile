import 'package:flutter/material.dart';

import 'models/user.dart';

class HomeState {
  User user;

  HomeState(this.user);
  HomeState.fromAppState(HomeState another) {
    user = another.user;
  }
}
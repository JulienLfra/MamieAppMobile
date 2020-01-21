import 'package:flutter/material.dart';
import '../screens/home.dart';

class Test extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return new Text(state.family.family_name+" - "+state.family.family_id.toString());
  }
}
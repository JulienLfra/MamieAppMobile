import 'package:flutter/material.dart';


class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xfff8faf8),
        centerTitle: true,
        elevation: 1.0,
        title: Text('Message'),
      ),
      body: Center(
        child: Container(
          child: Text('To do'),
        ),
      ),
    );
  }
}
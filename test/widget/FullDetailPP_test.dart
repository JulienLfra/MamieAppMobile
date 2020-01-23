import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mamieapp/models/user.dart';
import 'package:mamieapp/widgets/userDetails/FullDetailPP.dart';
import 'dart:core';

void main() {
  testWidgets('Build detail page', (WidgetTester tester) async {
    // Our fake user
    var userMock = new User(0, "test", "test", "plaideaug83170@gmail.com", "test", "test", "test", "test", "test", "test", "test", 21);
    // Build the FullDetailPP widget
    await tester.pumpWidget(FullDetailPP(userMock));
    // Look for the error txt
    final errorFinder = find.text('error');
    // Want nothing
    expect(errorFinder, findsNothing);
    // Todo Le context de sizeof n'existe pas ?
  });
}

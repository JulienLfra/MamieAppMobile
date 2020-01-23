import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mamieapp/api/uploadPhoto.dart';
import 'package:mamieapp/models/user.dart';

void main() {
  test('Test upload file to server', () async {
    final uploadPhoto = UploadPhoto();

    var fileMock = new File('test/resources/test.png');
    var userMock = new User(0, "test", "test", "test", "test", "test", "test", "test", "test", "test", "test", 21);
    bool res = await uploadPhoto.upload(fileMock, userMock);

    expect(res, true);
  });
}
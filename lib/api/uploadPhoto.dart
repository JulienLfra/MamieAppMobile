import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:mamieapp/models/user.dart';

class UploadPhoto{

  Future getImage(User user) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    upload(image, user);
  }

  upload(File imageFile, User user) async {

    if (imageFile == null) return;
    String base64Image = base64Encode(imageFile.readAsBytesSync());
    //String fileName = imageFile.path.split("/").last;
    // Todo trouver un moyen de nomer les photos
    String fileName = user.mail+".png";

    // Todo move to api class
    http.post("http://benjamin.molinet.free.fr/projetMamie/medias/image.php", body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      print(res.statusCode);
    }).catchError((err) {
      print(err);
    });
  }
}
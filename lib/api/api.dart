import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "";

class API {
  static Future getFamilies() {
    var url = baseUrl + "http://benjamin.molinet.free.fr/projetMamie/getFamilies.php";
    return http.get(url);
  }
}
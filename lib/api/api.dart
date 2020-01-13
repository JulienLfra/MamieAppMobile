import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "";

class API {
  static Future getFamilies() {
    var url = baseUrl + "http://benjamin.molinet.free.fr/projetMamie/getFamilies.php";
    return http.get(url);
  }

  static Future getMembersByFamilyId(int id_family) {
    var url = baseUrl + "http://benjamin.molinet.free.fr/projetMamie/getUsersByFamily"+id_family.toString()+".php";
    return http.get(url);
  }
}
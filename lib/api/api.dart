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

  static Future getUserByMail(String mail) async {
    var url = baseUrl + "http://35.180.28.149:5000/personneMail?mail="+mail;
    final resp = await http.get(url);
    if(resp.statusCode == 200){
      print("resp Ok");
      return resp;
    }
    else{
      throw Exception("mabite");
    }
  }
}
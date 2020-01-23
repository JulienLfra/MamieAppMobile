import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = "";

class API {
  static Future getFamilies() {
    var url = baseUrl + "http://benjamin.molinet.free.fr/projetMamie/getFamilies.php";
    return http.get(url);
  }

  static Future getFamiliesByMail(String email) {
    var url = baseUrl + "http://35.180.28.149:5000/familleMail?mail="+email;
    return http.get(url);
  }

  static Future getMembersByFamilyName(String nom) {
    var url = baseUrl + "http://35.180.28.149:5000/membresFamille?mail="+nom;
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
      throw Exception("Get user by Mail failed");
    }
  }

  Future setUserByMail( String mail, {String body}) async {
    print("send 1");
    return http.post("http://35.180.28.149:5000/personneMail?mail=" + mail, body: body).then((http.Response response) {
      print("send 2");
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      //return User2.fromJson(json.decode(response.body));
    });
  }
//  static Future setUserByMail(String mail) async {
//    var url = baseUrl + "http://35.180.28.149:5000/personneMail?mail="+mail;
//    final resp = await http.post(url, body: body);
//    if(resp.statusCode == 200){
//      print("resp Ok");
//      return resp;
//    }
//    else{
//      throw Exception("Get user by Mail failed");
//    }
//  }
}

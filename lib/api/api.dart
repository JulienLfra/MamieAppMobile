import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mamieapp/models/event.dart';
import 'package:mamieapp/models/user.dart';

const baseUrl = "";

class API {
  static Future getUsers() {
    var url = baseUrl + "http://35.180.228.4:5000/personnes";
    return http.get(url);
  }

  static Future getPlaces() {
    var url = baseUrl + "http://35.180.228.4:5000/personnes";
    return http.get(url);
  }

  static Future getFamilies() {
    var url = baseUrl + "http://benjamin.molinet.free.fr/projetMamie/getFamilies.php";
    return http.get(url);
  }

  static Future getFamiliesByMail(String email) {
    var url = baseUrl + "http://35.180.228.4:5000/familleMail?mail="+email;
    return http.get(url);
  }

  static Future getMembersByFamilyId(String id) {
    var url = baseUrl + "http://35.180.228.4:5000/membresFamilleById?id="+id;
    return http.get(url);
  }

  static Future getUserByMail(String mail) async {
    var url = baseUrl + "http://35.180.228.4:5000/personneMail?mail="+mail;
    final resp = await http.get(url);
    if(resp.statusCode == 200){
      return resp;
    }
    else{
      throw Exception("Get user by Mail failed");
    }

  }

  static Future getEventByMail(String mail) async {
    var url = baseUrl + "http://35.180.228.4:5000/evenementsByUserMail?mail=" + mail;
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      return resp;
    }
    else {
      throw Exception("Get evenements by Mail failed");
    }
  }

  Future setUserByMail( String mail, {String body}) async {

    return http.post("http://35.180.228.4:5000/personneMail?mail=" + mail, body: body).then((http.Response response) {

      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      //return User2.fromJson(json.decode(response.body));
    });
  }

  static setUserLocation(User user, Position coord) async {
    // set up PUT request arguments
    String url = 'http://35.180.228.4:5000/changerPositionPersonne?mail='+user.mail+'&latitude='+coord.latitude.toString()+'&longitude='+coord.longitude.toString();
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{}';
    // make PUT request
    http.Response response = await http.put(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the updated item with the id added
    String body = response.body;
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 1
    // }
  }


  Future setEvent( Event event) async {
    String body = jsonEncode(event);
    Map<String, String> headers = {"Content-type": "application/json"};
    http.post("http://35.180.228.4:5000/evenement", headers: headers, body: body);
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
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mamieapp/api/api.dart';
import 'package:mamieapp/models/user.dart';
import 'package:mamieapp/resources/globalSettings.dart';

import 'package:geolocator/geolocator.dart';
import 'package:mamieapp/screens/home.dart';


class MyGoogleMap extends StatefulWidget {

  BuildContext context;
  MyGoogleMap(context){this.context = context;}

  @override
  State<MyGoogleMap> createState() => MyGoogleSampleState(context);
}

class MyGoogleSampleState extends State<MyGoogleMap> {

  BuildContext context;
  MyGoogleSampleState(context){this.context = context;}


  List<User> users;

  // Global settings
  GlobalSettings settings = new GlobalSettings();

  @override
  void initState() {
    super.initState();
  }

  Future<Position> getPosition(context) async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    API.setUserLocation(state.userLogged, position);

    var markerIdVal = "1";
    final MarkerId markerId = MarkerId(markerIdVal);
    _markers.add(new Marker(
      markerId: markerId,
      position: LatLng(position.latitude, position.longitude),
        infoWindow: InfoWindow(title: "Vous"),
    ));
    return position;
  }

  Set<Marker> _markers = {};
//  final Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {

    _markers.clear();
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    state.users.forEach((user) => _markers.add(new Marker(
        markerId: new MarkerId(user.mail),
        position: LatLng(user.latitude, user.longitude),
        infoWindow: InfoWindow(title: user.prenom, snippet: user.ville),
        onTap: () {
          state.selectUser(user);
        },
    )));
//    Position position = getPosition();
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          FutureBuilder<Position>(
            future: getPosition(context),
            builder: (context, snapshot){
              if (snapshot.hasData) {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(snapshot.data.latitude, snapshot.data.longitude),
                    zoom: 11,
                  ),
                  markers: _markers,
                );
              } else {
                return CircularProgressIndicator();
              }
            }
          ),
          Positioned(
            top: 10,
            right: 10,
            child: FloatingActionButton(
              backgroundColor: settings.color2,
              onPressed: _getLocation,
              tooltip: 'Get Location',
              child: Icon(
                  Icons.location_on
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _getLocation() async {
    Position currentLocation = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: "U"),
      );
//      _markers["Current Location"] = marker;
    });
  }
}
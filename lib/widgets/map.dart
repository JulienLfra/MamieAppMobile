import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mamieapp/models/user.dart';
import 'package:mamieapp/resources/globalSettings.dart';

import 'package:geolocator/geolocator.dart';


class MyGoogleMap extends StatefulWidget {

  List<User> users;

  MyGoogleMap(users){
    this.users = users;
  }

  @override
  State<MyGoogleMap> createState() => MyGoogleSampleState(users);
}

class MyGoogleSampleState extends State<MyGoogleMap> {

  List<User> users;

  MyGoogleSampleState(users){
    this.users = users;
  }

  // Global settings
  GlobalSettings settings = new GlobalSettings();

  Future<Position> getPosition() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    var markerIdVal = "1";
    final MarkerId markerId = MarkerId(markerIdVal);
    _markers.add(new Marker(
      markerId: markerId,
      position: LatLng(position.latitude, position.longitude)
    ));
    return position;
  }

  Set<Marker> _markers = {};
//  final Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
//    Position position = getPosition();
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          FutureBuilder<Position>(
            future: getPosition(),
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
      //_markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: "U"),
      );
//      _markers["Current Location"] = marker;
    });
  }
}
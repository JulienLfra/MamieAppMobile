import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGoogleMap extends StatefulWidget {
  @override
  State<MyGoogleMap> createState() => MyGoogleSampleState();
}

class MyGoogleSampleState extends State<MyGoogleMap> {
  final Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            //mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: LatLng(45.788841, 4.844015),
              zoom: 11,
            ),
            markers: _markers.values.toSet(),
          ),
          Align(alignment: Alignment.topRight,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
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
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    setState(() {
      //_markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: 'Your Location'),
      );
      _markers["Current Location"] = marker;
    });
  }

}
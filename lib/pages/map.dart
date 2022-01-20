import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map extends StatefulWidget {
  const map({Key key}) : super(key: key);

  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  // GoogleMapController mapController;

  // final LatLng _center = const LatLng(45.521563, -122.677433);
  var garagemarkers = HashSet<Marker>();

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(29.998350, 31.804470), zoom: 8),
          onMapCreated: (GoogleMapController googleMapController) {
            setState(() {
              garagemarkers.add(
                Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(29.998350, 31.804470),
                ),
              );
              garagemarkers.add(
                Marker(
                  markerId: MarkerId('2'),
                  position: LatLng(
                    30.169335,
                    31.491458,
                  ),
                ),
              );

              garagemarkers.add(
                Marker(
                  markerId: MarkerId('3'),
                  position: LatLng(
                    29.952933,
                    30.990637,
                  ),
                ),
              );
            });
          },
          markers: garagemarkers,
        ),
      ),
    );
  }
}

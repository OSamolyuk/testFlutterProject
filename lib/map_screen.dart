import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const double _defaultCameraZoom = 12;
const LatLng _minskLatLng = LatLng(53.9, 27.5618225);
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);


  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {

  late final CameraPosition _cameraPosition = const CameraPosition(
    target:  _minskLatLng,
    zoom: _defaultCameraZoom,
  );
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
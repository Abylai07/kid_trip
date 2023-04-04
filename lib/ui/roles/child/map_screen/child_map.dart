import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChildMap extends StatefulWidget {
  const ChildMap({Key? key}) : super(key: key);

  @override
  State<ChildMap> createState() => ChildMapState();
}

class ChildMapState extends State<ChildMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kAlmaty = CameraPosition(
    target: LatLng(43.238949, 76.889709),
    zoom: 12,
  );

  static const CameraPosition _kIITU = CameraPosition(
      bearing: 162.8334901395799,
      target: LatLng(43.23513827456558, 76.90970487197572),
      tilt: 69.440717697143555,
      zoom: 18.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kAlmaty,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheIITU,
        label: const Text('To the IITU!'),
        icon: const Icon(Icons.directions_walk_outlined),
      ),
    );
  }

  Future<void> _goToTheIITU() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kIITU));
  }
}

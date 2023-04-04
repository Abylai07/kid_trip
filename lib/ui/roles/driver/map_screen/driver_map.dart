import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../constants/app_colors.dart';

class DriverMap extends StatefulWidget {
  const DriverMap({Key? key}) : super(key: key);

  @override
  State<DriverMap> createState() => DriverMapState();
}

class DriverMapState extends State<DriverMap> {
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
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
            backgroundColor: AppColors.blackTextColor,
            child: Icon(
              Icons.menu,
              color: AppColors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [
          IconButton(
              iconSize: 40,
              onPressed: () {},
              icon: const CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 24,
                ),
              )),
        ],
      ),
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

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kid_trip/constants/app_colors.dart';

import 'components/location_service.dart';

class ParentMap extends StatefulWidget {
  const ParentMap({Key? key}) : super(key: key);

  @override
  State<ParentMap> createState() => ParentMapState();
}

class ParentMapState extends State<ParentMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  TextEditingController searchController = TextEditingController();

  final Set<Marker> _markers = <Marker>{};
  //final Set<Polygon> _polygons = <Polygon>{};
  //List<LatLng> _polygonLatLng = <LatLng>[];

  int polygonIdCounter = 1;

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
  void initState() {
    super.initState();
    _setMarker(const LatLng(43.238949, 76.889709));
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('marker'),
          position: point,
          infoWindow: const InfoWindow(
            title: 'Marker Title',
            snippet: 'My Custom',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: AppColors.blackTextColor,
              child: Icon(Icons.menu),
            )),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundColor: AppColors.mainBGColor,
                child: Icon(Icons.person),
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              markers: _markers,
              initialCameraPosition: _kAlmaty,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          context: context,
          backgroundColor: Colors.white,
          builder: (context) => Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: searchController,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          hintText: 'Search school',
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      var place = await LocationService()
                          .getPlace(searchController.text.trim());
                      _goToThePlace(place);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        label: const Text('GO!'),
        icon: const Icon(Icons.directions_walk_outlined),
      ),
    );
  }

  Future<void> _goToThePlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 18,
        ),
      ),
    );
    _setMarker(LatLng(lat, lng));
  }

  Future<void> _goToTheIITU() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kIITU));
  }
}

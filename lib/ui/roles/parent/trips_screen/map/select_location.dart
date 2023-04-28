import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kid_trip/constants/app_colors.dart';
import 'package:kid_trip/ui/roles/parent/trips_screen/one_time_trip.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/navigator.dart';
import '../../parent_navigation.dart';
import 'components/directions_model.dart';
import 'components/direstions_repository.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => SelectLocationState();
}

class SelectLocationState extends State<SelectLocation> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  TextEditingController firstPointController = TextEditingController();
  TextEditingController secondPointController = TextEditingController();

  final Set<Marker> _markers = <Marker>{};
  Marker? _origin;
  Marker? _destination;
  Directions? _info;

  int polygonIdCounter = 1;

  static const CameraPosition _kAlmaty = CameraPosition(
    target: LatLng(43.238949, 76.889709),
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    _setMarker(const LatLng(43.238949, 76.889709));
  }

  @override
  void dispose() {
    super.dispose();
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

  void tripModalBottom() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(26))),
        builder: (context) {
          return OneTimeTrip(
            latLngA: _origin?.position,
            latLngB: _destination?.position,
            distance: _info?.totalDistance,
            time: _info?.totalDuration,
          );
        });
  }

  Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace) {
      print('error $error');
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 180,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GestureDetector(
            onTap: (){
              AppNavigator.push(context: context, page: const ParentNavigation());
            },
            child: Image.asset(
              AppAssets.images.logo,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
            },
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kAlmaty,
            markers: {
              if (_origin != null) _origin!,
              if (_destination != null) _destination!
            },
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info!.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            onLongPress: _addMarker,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          if (_info != null)
            Positioned(
              top: 60.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  '${_info!.totalDistance}, ${_info!.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.mainBGColor,
            onPressed: () {
              getCurrentLocation().then((value) => {
              //  print('my location ${value.longitude} ${value.latitude}'),
                _markers.add(
                   Marker(
                    markerId: const MarkerId('my'),
                    position: LatLng(value.latitude, value.latitude),
                    infoWindow: const InfoWindow(title: 'My current location')
                  ),
                )
              });
              setState(() {

              });
              //tripModalBottom();
        },
        label:  const Text('Нажмите здесь для поиска'),
        ),
      ),
    );
  }

  Future<void> goToThePlace(Map<String, dynamic> place) async {
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

  Future<void> goRoute() async {
    final GoogleMapController controller = await _controller.future;

    print('_info -- ${_info}');
    controller.animateCamera(
      _info != null
          ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
          : CameraUpdate.newCameraPosition(_kAlmaty),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Пункт А'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        // Reset destination
        _destination = null;

        // Reset info
        _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Пункт Б'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin!.position, destination: pos);
      setState(() => _info = directions);
    }
  }
}

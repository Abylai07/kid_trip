import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kid_trip/constants/app_colors.dart';
import 'dart:ui' as ui;

class ParentMap extends StatefulWidget {
  const ParentMap({Key? key}) : super(key: key);

  @override
  State<ParentMap> createState() => ParentMapState();
}

class ParentMapState extends State<ParentMap> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  Set<Marker> markers = <Marker>{}; //markers for google map

  LatLng startLocation = const LatLng(43.23831910614763, 76.93895503878593);
  LatLng endLocation = const LatLng(43.24159102112541, 76.91398669034243);
  LatLng carLocation = const LatLng(43.23558928211451, 76.90737001597881);


  static const CameraPosition _kAlmaty = CameraPosition(
    target: LatLng(43.238949, 76.889709),
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    addMarkers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  addMarkers() async {
    Uint8List markerIcon = await getBytesFromAsset('assets/images/png/boy1.png', 100);
    Uint8List markerIcon2 = await getBytesFromAsset('assets/images/png/girl.png', 100);

    markers.add(
        Marker( //add start location marker
          markerId: MarkerId(startLocation.toString()),
          position: startLocation,
          infoWindow: const InfoWindow(
            title: 'Ерхан',
            snippet: 'Школа',
          ),
          icon: BitmapDescriptor.fromBytes(markerIcon),
        )
    );

    markers.add(
        Marker( //add start location marker
          markerId: MarkerId(endLocation.toString()),
          position: endLocation,
       //   rotation: -45,
          infoWindow: const InfoWindow(
            title: 'Шырын',
            snippet: 'Дом',
          ),
          icon: BitmapDescriptor.fromBytes(markerIcon2),
        )
    );

    String imgurl = "https://www.fluttercampus.com/img/car.png";
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgurl))
        .load(imgurl))
        .buffer
        .asUint8List();

    markers.add(
        Marker( //add start location marker
          markerId: MarkerId(carLocation.toString()),
          position: carLocation, //position of marker
          infoWindow: const InfoWindow( //popup info
            title: 'Айдар',
            snippet: 'В пути',
          ),
          icon: BitmapDescriptor.fromBytes(bytes), //Icon for Marker
        )
    );
    setState(() {});
  }
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
          markers: markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      );
    }
}
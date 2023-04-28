import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kid_trip/constants/app_colors.dart';
import 'package:kid_trip/constants/app_styles.dart';
import 'package:kid_trip/ui/roles/parent/parent_navigation.dart';

import '../../../../constants/navigator.dart';
import '../../../widgets/alert_dialog/success_alert_dialog.dart';

class OneTimeTrip extends StatefulWidget {
  const OneTimeTrip(
      {Key? key, this.latLngA, this.latLngB, this.distance, this.time})
      : super(key: key);
  final LatLng? latLngA;
  final LatLng? latLngB;
  final String? distance;
  final String? time;

  @override
  State<OneTimeTrip> createState() => _OneTimeTripState();
}

class _OneTimeTripState extends State<OneTimeTrip> {
  TextEditingController firstPointController = TextEditingController();
  TextEditingController secondPointController = TextEditingController();

  Future<String?> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address = "${placemark.street}, ${placemark.locality}";
        return address;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    if (widget.latLngA != null) {
      getAddressFromLatLng(widget.latLngA!.latitude, widget.latLngA!.longitude)
          .whenComplete(() async {
        firstPointController.text = (await getAddressFromLatLng(
            widget.latLngA!.latitude, widget.latLngA!.longitude))!;
      });
      getAddressFromLatLng(widget.latLngB!.latitude, widget.latLngB!.longitude)
          .whenComplete(() async {
        secondPointController.text = (await getAddressFromLatLng(
            widget.latLngB!.latitude, widget.latLngB!.longitude))!;
      });
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Откуда забрать',
              style: AppStyles.bodyLarge,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: firstPointController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Пункт A',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: AppColors.grey.withOpacity(0.2),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Куда отвезти',
              style: AppStyles.bodyLarge,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: secondPointController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Пункт Б',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: AppColors.grey.withOpacity(0.2),
              ),
              onChanged: (value) {},
            ),
            widget.distance != null
                ? Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    'Цена ${40 * double.parse(widget.distance!.replaceAll(RegExp('[^0-9]'), ''))}',
                    style: AppStyles.titleSmall,
                  ),
                  Text(
                    'Время поездки ${int.parse(widget.time!.replaceAll(RegExp('[^0-9]'), ''))} мин',
                    style: AppStyles.titleSmall,
                  ),
                ],
              ),
            )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainBGColor,
                ),
                onPressed: () async {
                  if (widget.distance!.isNotEmpty) {
                    successAlertDialog(
                      context: context,
                      title:
                      'Вы заказ принять ожидайте ответа от водителей',
                      buttonText: 'На главную страницу',
                      onPressed: () {
                        AppNavigator.push(
                            context: context, page: const ParentNavigation());
                      },
                    );
                  }
                },
                child: const Text('Отправить заказ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kid_trip/constants/app_styles.dart';
import 'package:kid_trip/constants/navigator.dart';
import 'package:kid_trip/ui/roles/parent/trips_screen/components/one_time_trip.dart';

import '../../../../constants/app_colors.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Выберите тип поездок!', style: AppStyles.titleMediumBold,),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainBGColor,
                ),
                onPressed: (){
                  AppNavigator.push(context: context, page: const OneTimeTrip());
                },
                child: const Text('Разовая поездка на такси'),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainBGColor,
                ),
                onPressed: (){
                //  AppNavigator.push(context: context, page: const OneTimeTrip());
                },
                child: const Text('Абонементы'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

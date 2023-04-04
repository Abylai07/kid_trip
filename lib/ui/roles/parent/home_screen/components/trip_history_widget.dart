import 'package:flutter/material.dart';
import 'package:kid_trip/constants/app_colors.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_styles.dart';

class TripHistoryWidget extends StatelessWidget {
  const TripHistoryWidget({
    Key? key, required this.pointA, required this.pointB, required this.time, required this.status,
  }) : super(key: key);

  final String pointA;
  final String pointB;
  final String time;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:  AppColors.lightBlue.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(AppAssets.images.pointA, height: 20,),
                    const SizedBox(height: 12),
                    Image.asset(AppAssets.images.pointB, height: 20,),
                  ],
                ),
                const SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pointA,
                      style: AppStyles.bodyLarge,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      pointB,
                      style: AppStyles.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: AppStyles.labelLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Статус: $status',
                  style: AppStyles.labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

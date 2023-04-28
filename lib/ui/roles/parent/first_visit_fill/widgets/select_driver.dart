import 'package:flutter/material.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';

class SelectDriver extends StatelessWidget {
  const SelectDriver({
    super.key, required this.containerColor,
  });
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.asset(
                AppAssets.images.driver,
                fit: BoxFit.cover,
                height: 120,
                width: 100,
              ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Анаят Абылай',
                style: AppStyles.titleSmall,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'возраст: 38 лет',
                style: AppStyles.bodySmall,
              ),
              Text(
                'стаж работы: 8 лет',
                style: AppStyles.bodySmall,
              ),
              Text(
                'пол: мужчинa',
                style: AppStyles.bodySmall,
              ),
            ],
          ),
          const SizedBox(width: 12),
          Stack(
            children: const [
              SizedBox(
                width: 60,
                height: 60,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.star,
                    color: AppColors.darkBlue,
                    size: 60,
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: Center(
                  child: Text(
                    "4.5",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
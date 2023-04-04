import 'package:flutter/material.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';

InkWell tutorWidget(
    {required String img,
    required String name,
    required String subj,
    required String price,
    required Function() onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      height: 130,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: AppColors.lightBlue.withOpacity(0.5)),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(30)),
                child: Container(
                  height: 125,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.images.iconBgNew),
                          fit: BoxFit.contain)),
                ),
              ),
              Container(
                height: 130,
                padding: const EdgeInsets.only(left: 5, top: 5),
                child: Stack(
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
              ),
              Positioned(
                left: 50,
                child: Hero(
                  tag: img,
                  child: Container(
                    width: 100,
                    height: 130,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/png/$img.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    subj,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkBlue),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$$price/session",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

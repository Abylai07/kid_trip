import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_trip/constants/app_assets.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../constants/navigator.dart';
import '../../roles/parent/parent_navigation/parent_navigation.dart';

successAlertDialog({required BuildContext context, required String title, required String buttonText}) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actionsPadding: EdgeInsets.all(28.w),
        actions: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(AppAssets.images.done, height: 60),),
          const SizedBox(height: 24,),
          Text(
            title,
            style: AppStyles.s16w500.merge(
              const TextStyle(
                color: AppColors.black3,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainBGColor,
              ),
              onPressed: () {
                AppNavigator.push(
                    context: context, page: const ParentNavigation());
              },
              child: Text(buttonText),
            ),
          ),
        ],
      );
    },
  );
}

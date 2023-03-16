import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../constants/navigator.dart';
import '../../login_screen/login_screen.dart';


void LogoutAlertDialog(BuildContext context){
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actionsPadding: EdgeInsets.all(28.w),
        actions: [
          Text(
            'Вы точно хотите выйти?',
            style: AppStyles.s20w500.merge(
              const TextStyle(
                color: AppColors.primaryGreen,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
              ),
              onPressed: () {
                AppNavigator.pushAndRemove(context: context, page: const LoginScreen());
              },
              child: const Text('Выйти'),
            ),
          ),
        ],
      );
    },
  );
}
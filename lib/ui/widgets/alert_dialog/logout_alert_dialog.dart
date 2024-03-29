import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../constants/navigator.dart';
import '../../login_screen/login_screen.dart';

Future<void> stateRemove() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove('token');
}

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
                color: AppColors.mainBGColor,
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
                stateRemove();
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
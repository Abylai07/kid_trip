import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppStyles {
  static const s11w400 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );
  static const s12w400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const s12w500 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(130, 130, 130, 1)
  );
  static const s14w500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const s16w400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.allTextColor,
  );
  static const s16w500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.allTextColor,
  );
  static const s16w700 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.allTextColor,
  );
  static const s20w500 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
      color: Colors.white
  );
  static const s36w500 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: Colors.white
  );
  static const loginTitleStyle = TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteTextColor
  );
  static const fontFamily = 'Manrope';

  static final headlineLarge = TextStyle(
      fontSize: 28.sp, fontWeight: FontWeight.w800, fontFamily: fontFamily);
  static final headlineMedium = TextStyle(
      fontSize: 26.sp, fontWeight: FontWeight.w700, fontFamily: fontFamily);
  static final headlineSmall = TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily);

  static final titleLarge = TextStyle(
      fontSize: 22.sp, fontWeight: FontWeight.w500, fontFamily: fontFamily);
  static final titleMedium = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily);
  static final titleMediumBold = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily);
  static final titleSmall = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w500, fontFamily: fontFamily);

  static final bodyLarge = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w500, fontFamily: fontFamily);
  static final bodyMedium = TextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w500, fontFamily: fontFamily);
  static final bodySmall = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily);

  static final labelLarge = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily);
  static final labelMedium = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, fontFamily: fontFamily);
  static final labelSmall = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily);

  static final displayLarge =
  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400);
  static final displayMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static final displaySmall =
  TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400);
}

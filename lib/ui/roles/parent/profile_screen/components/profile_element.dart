import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import 'default.dart';

class ProfileElement extends StatelessWidget {
  final String? text;
  final Color? color;
  final String? image;
  final Function()? onTap;
  const ProfileElement(
      {Key? key, this.text, this.image, this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.w, top: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  DefaultContainer(
                    color: color,
                    padding: 10,
                    child: Image.asset(image!, width: 22.w),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 11.w),
                      child: Text(
                        text!,
                        style: AppStyles.s16w400),
                      ),
                    ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, color: AppColors.primaryGray)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    super.key,
    required this.gender, this.onPressed,
  });

  final String gender;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            backgroundColor: AppColors.transparent,
            shape: RoundedRectangleBorder(side: const BorderSide(
              color: AppColors.darkGray,
              width: 1,
            ), borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(gender, style: AppStyles.labelLarge.copyWith(color: AppColors.blackGray),),
              SvgPicture.asset(AppAssets.svg.redact),
            ],
          )
      ),
    );
  }
}
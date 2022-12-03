import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.onPressed, required this.title});

  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.mainBGColor,
          backgroundColor: AppColors.whiteTextColor, // foreground
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
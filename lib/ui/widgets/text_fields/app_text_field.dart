import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../utils/app_utils.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key, required this.controller, required this.icon, required this.hintText, required this.enabled, required this.number, required this.inputFormatter}) : super(key: key);

  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatter;
  final String icon;
  final bool enabled;
  final bool number;
  final String hintText;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        width: 1.sw,
        child: TextField(
          controller: controller,
          inputFormatters: inputFormatter,
          keyboardType: number ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset(icon),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.darkGray,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 150.w),
    actionsPadding: EdgeInsets.all(12.w),
    actions: const [
      Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    ],
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

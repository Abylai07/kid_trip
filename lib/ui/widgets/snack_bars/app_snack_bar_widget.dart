import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_trip/ui/widgets/snack_bars/snack_bar.dart';

import '../../../constants/app_colors.dart';

class AppSnackBarWidget extends StatelessWidget {
  const AppSnackBarWidget({
    Key? key,
    required this.description,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  final String? description;
  final VoidCallback onPressed;
  final Color? color;

  Future<void> show(
      BuildContext context,
      ) async {
    showTopSnackBar(
      context,
      this,
      onTap: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(12.w)),
      color: color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
        child: Text(
          '$description',
          maxLines: 2,
          style: const TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
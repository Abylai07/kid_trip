import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_trip/ui/roles/parent/first_visit_fill/widgets/select_driver.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/navigator.dart';
import '../../../widgets/buttons/app_button.dart';
import '../parent_navigation.dart';

class FirstFillDriver extends StatefulWidget {
  const FirstFillDriver({Key? key}) : super(key: key);

  @override
  State<FirstFillDriver> createState() => _FirstFillDriverState();
}

class _FirstFillDriverState extends State<FirstFillDriver> {
  int selectIndex = -1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Заполнение профиля",
          style: AppStyles.labelLarge.merge(
            const TextStyle(color: AppColors.black),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            AppNavigator.pop(context: context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.mainBGColor),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectIndex = i;
              });
            },
            child: SelectDriver(
              containerColor: selectIndex == i ? AppColors.black.withOpacity(
                  0.2) : AppColors.lightBlue.withOpacity(0.5),),
          );
        }
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
        child: AppButton(
          onPressed: () {
            AppNavigator.push(context: context, page: const ParentNavigation());
          },
          child: const Text('Сохранить'),
        ),
      ),
    );
  }
}



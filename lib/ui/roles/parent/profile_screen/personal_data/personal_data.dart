import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../../constants/navigator.dart';
import '../../../../widgets/buttons/app_button.dart';
import '../../../../widgets/text_fields/app_text_field.dart';


class PersonalDataView extends StatefulWidget {
  const PersonalDataView({Key? key}) : super(key: key);

  @override
  _PersonalDataView createState() => _PersonalDataView();
}

class _PersonalDataView extends State<PersonalDataView> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  snackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: AppColors.primaryGreen,
        content: Text(
          'Успешно!',
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 5),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 170.h,
          right: 24.w,
          left: 24.w,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Личные данные",
          style: AppStyles.labelLarge.merge(
            const TextStyle(color: AppColors.black),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            AppNavigator.pop(context: context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.primaryGreen),
          ),
        // actions: [
        //   BonusPointElement(
        //     image: AppAssets.bonus,
        //     width: 16,
        //     height: 16,
        //     textStyle: AppStyles.labelLarge.merge(
        //       TextStyle(
        //         color: AppColors.black,
        //       ),
        //     ),
        //     text: '0B',
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.darkGray,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          color: AppColors.darkGray,
                          size: 128.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => const CupertinoActionSheet(
                              actions: [
                                // CupertinoActionSheetAction(
                                //   onPressed: () {
                                //     pickImage(ImageSource.gallery);
                                //   },
                                //   child: Text('Выбрать из галереи'),
                                // ),
                                // CupertinoActionSheetAction(
                                //   onPressed: () {
                                //     pickImage(ImageSource.camera);
                                //   },
                                //   child: Text('Сделать снимок'),
                                // ),
                                // CupertinoActionSheetAction(
                                //   onPressed: () {
                                //     deleteImage();
                                //   },
                                //   child: Text('Удалить фото'),
                                // ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: AppColors.greenLinearGradient,
                            ),
                            borderRadius: BorderRadius.circular(12.w),
                          ),
                          child: const Icon(Icons.camera_alt,
                              color: AppColors.white),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                AppTextField(
                  controller: nameController,
                  icon: AppAssets.svg.redact,
                  hintText: 'Aigul',
                  enabled: true,
                  number: false,
                ),
                AppTextField(
                  controller: emailController,
                  icon: AppAssets.svg.redact,
                  hintText: 'aigul@gmail.com',
                  enabled: false,
                  number: false,
                ),
                AppTextField(
                  controller: phoneController,
                  icon: AppAssets.svg.redact,
                  hintText: '+7714424343',
                  enabled: true,
                  number: true,
                ),
              ],
            )
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
        child: AppButton(
          onPressed: () {

          },
          child: Text('Сохранить'),
        ),
      ),
    );
  }
}

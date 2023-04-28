import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kid_trip/ui/roles/parent/first_visit_fill/first_fill_driver.dart';
import 'package:kid_trip/ui/roles/parent/first_visit_fill/widgets/child_info_input.dart';
import 'package:kid_trip/ui/roles/parent/parent_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/navigator.dart';
import '../../../../utils/app_utils.dart';
import '../../../widgets/buttons/app_button.dart';
import '../../../widgets/buttons/outline_button.dart';
import '../../../widgets/modal_bottom/gender_modal_bottom.dart';
import '../../../widgets/text_fields/app_text_field.dart';

class FirstFillProfile extends StatefulWidget {
  const FirstFillProfile({Key? key}) : super(key: key);

  @override
  State<FirstFillProfile> createState() => _FirstFillProfileState();
}

class _FirstFillProfileState extends State<FirstFillProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController controller = TextEditingController();

  String genderParent = 'Выберите пол';
  String genderChild = 'Выберите пол';
  String classChild = 'Выберите класс';
  int childCount = 1;

  snackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: AppColors.primaryGreen,
        content: const Text(
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

  void saveImage(String val) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('image', val);
  }

  String? imgPath;

  Future pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        saveImage(pickedImage.path.toString());
        setState(() {
          imgPath = pickedImage.path;
        });
        return snackBar();
      }
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
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
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      imgPath != null
                          ? SizedBox(
                              width: 128.sp,
                              height: 128.sp,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90.0),
                                child: Image.file(
                                  File(imgPath!),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          : Container(
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
                            builder: (context) => CupertinoActionSheet(
                              actions: [
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    pickImage(ImageSource.gallery);
                                  },
                                  child: const Text('Выбрать из галереи'),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    pickImage(ImageSource.camera);
                                  },
                                  child: const Text('Сделать снимок'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: AppColors.mainBGColor,
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
                Text(
                  'Основная информация',
                  style: AppStyles.titleLarge,
                ),
                AppTextField(
                  controller: nameController,
                  icon: AppAssets.svg.redact,
                  hintText: 'Имя и Фамиля',
                  enabled: true,
                  number: false,
                  inputFormatter: [AppUtils.textMaskFormatter],
                ),
                AppTextField(
                  controller: emailController,
                  icon: AppAssets.svg.redact,
                  hintText: 'Почта',
                  enabled: true,
                  number: false,
                  inputFormatter: [AppUtils.textMaskFormatter],
                ),
                AppTextField(
                  controller: phoneController,
                  icon: AppAssets.svg.redact,
                  hintText: 'Номер телефона',
                  enabled: true,
                  number: true,
                  inputFormatter: [AppUtils.phoneMaskFormatter],
                ),
                AppTextField(
                  controller: dateController,
                  icon: AppAssets.svg.redact,
                  hintText: 'дд.мм.гггг',
                  enabled: true,
                  number: true,
                  inputFormatter: [AppUtils.dateMaskFormatter],
                ),
                OutlineButton(
                  gender: genderParent,
                  onPressed: () {
                    showModalSheet(context, genderParent);
                  },
                ),
                const SizedBox(height: 24),
                Text(
                  'Информация о детях',
                  style: AppStyles.titleLarge,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: childCount,
                    itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      index > 0 ?
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text('Новый ребенок', style: AppStyles.titleLarge,),
                      ) : const SizedBox(),
                      ChildInfoInput(
                        controller: controller,
                        genderChild: genderChild,
                        classChild: classChild,
                        calendar: 'Выберите дни',
                      ),
                    ],
                  );
                }),
                TextButton(
                  onPressed: () {
                    setState(() {
                      childCount++;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Добавить ещё',
                        style: AppStyles.titleMediumBold
                            .copyWith(color: AppColors.black),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.add_circle,
                        color: AppColors.mainBGColor,
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
        child: AppButton(
          onPressed: () {
            AppNavigator.push(context: context, page: const FirstFillDriver());
          },
          child: const Text('Сохранить'),
        ),
      ),
    );
  }
}

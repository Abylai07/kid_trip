import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../../constants/navigator.dart';
import '../../../../../utils/app_utils.dart';
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
  TextEditingController dateController = TextEditingController();

  String gender = 'Выберите пол';

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

  void saveImage(String val) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('image', val);
    getImage();
  }

  void getImage() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      imgPath = sharedPref.getString('image');
    });
  }

  void deleteImage() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove('image');
    getImage();
  }

  File? imgFile;
  String? imgPath;

  Future pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        deleteImage();
        saveImage(pickedImage.path.toString());
        setState(() {
          imgFile = File(pickedImage.path);
        });
        return snackBar();
      }
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  void initState() {
    getImage();
    super.initState();
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
                AppTextField(
                  controller: nameController,
                  icon: AppAssets.svg.redact,
                  hintText: 'Aigul',
                  enabled: true,
                  number: false,
                  inputFormatter: [AppUtils.textMaskFormatter],
                ),
                AppTextField(
                  controller: emailController,
                  icon: AppAssets.svg.redact,
                  hintText: 'aigul@gmail.com',
                  enabled: true,
                  number: false,
                  inputFormatter: [AppUtils.textMaskFormatter],
                ),
                AppTextField(
                  controller: phoneController,
                  icon: AppAssets.svg.redact,
                  hintText: '+7714424343',
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
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      backgroundColor: AppColors.transparent,
                      shape: RoundedRectangleBorder(side: const BorderSide(
                          color: AppColors.black,
                          width: 1,
                      ), borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: (){
                      _showModalSheet(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(gender, style: AppStyles.labelLarge.copyWith(color: AppColors.blackGray),),
                        SvgPicture.asset(AppAssets.svg.redact),
                      ],
                    )
                  ),
                ),
                const SizedBox(height: 12),
              ],
            )
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
        child: AppButton(
          onPressed: () {},
          child: const Text('Сохранить'),
        ),
      ),
    );
  }

  _showModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: Color(0xffF7F8F9),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      gender = 'Мужской';
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Мужской",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.mainBGColor, width: 2),
                          ),
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: gender == 'Мужской' ? AppColors.mainBGColor : Colors.transparent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      gender = 'Женский';
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Женский",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.mainBGColor,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(1),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: gender == 'Женский' ? AppColors.mainBGColor : Colors.transparent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

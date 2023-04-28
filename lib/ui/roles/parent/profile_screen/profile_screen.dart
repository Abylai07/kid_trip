import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_trip/ui/roles/parent/profile_screen/personal_data/personal_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/navigator.dart';
import '../../../widgets/alert_dialog/logout_alert_dialog.dart';
import 'components/default.dart';
import 'components/profile_element.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    getImage();
    super.initState();
  }

  String? imgPath;
  void getImage() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      imgPath = sharedPref.getString('image');
    });
  }

  Future stateRemove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.mainBGColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: 18.w,
                  left: 18.w,
                  top: 70.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            AppNavigator.push(
                              context: context,
                               page: const PersonalDataView(),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: DefaultContainer(
                              color: AppColors.white.withOpacity(0.2),
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: SvgPicture.asset(
                                  AppAssets.svg.redact,
                                  color: AppColors.white,
                                  width: 24.w,
                                  height: 24.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 20.w),
                            Container(
                              child: imgPath != null
                                  ? SizedBox(
                                width: 128.sp,
                                height: 128.sp,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(90.0),
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
                                  color: Colors.blueGrey,
                                  size: 128.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 4.w),
                            const Text('Aigul', style: AppStyles.s20w500),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 24.w),
                          child: SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: InkWell(
                              onTap: () {
                                // AppNavigator.push(
                                //   context: context,
                                //   page: NotificationView(),
                                // );
                              },
                              child: SvgPicture.asset(
                                AppAssets.svg.notif,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24.w),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 32.w, left: 32.w),
              child: Column(
                children: [
                  ProfileElement(
                    color: AppColors.veryBlue,
                    onTap: () {
                      // AppNavigator.push(
                      //   context: context,
                      //   page: UserFilesView(),
                      // );
                    },
                    text: "Мои дети",
                    image: AppAssets.images.friend,
                  ),
                  const Divider(thickness: 1),
                  ProfileElement(
                    onTap: () {
                      // AppNavigator.push(
                      //   context: context,
                      //   page: TournamentView(),
                      // );
                    },
                    color: AppColors.veryBlue,
                    text: "Мои платежи",
                    image: AppAssets.images.debitCard,
                  ),
                  const Divider(thickness: 1),
                  ProfileElement(
                    color: AppColors.veryBlue,
                    onTap: () {
                      _showModalSheet(context);
                    },
                    text: "Сменить язык",
                    image: AppAssets.images.language,
                  ),
                  const Divider(thickness: 1),
                  ProfileElement(
                    color: AppColors.veryBlue,
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => FeedbackListScreen(),
                      //   ),
                      // );
                    },
                    text: "Служба поддержки",
                    image: AppAssets.images.feedback,
                  ),
                  const Divider(thickness: 1),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
      color: AppColors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListTile(
          onTap: ()  {
            stateRemove();
            LogoutAlertDialog(context);
          },
          title: const Text('Выйти из аккаунта'),
          trailing: const DefaultContainer(
            color: AppColors.lightGray,
            child: Icon(Icons.arrow_forward, color: AppColors.mainBGColor),
          ),
        ),
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
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Қазақша",
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
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color:  Colors.transparent,
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
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Русский",
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
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
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
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "English",
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
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
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

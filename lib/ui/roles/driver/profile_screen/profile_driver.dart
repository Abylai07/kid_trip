import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kid_trip/ui/roles/driver/profile_screen/personal_data/personal_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/navigator.dart';
import '../../../widgets/alert_dialog/logout_alert_dialog.dart';
import '../../parent/profile_screen/components/default.dart';
import '../../parent/profile_screen/components/profile_element.dart';

class ProfileDriver extends StatefulWidget {
  const ProfileDriver({Key? key}) : super(key: key);

  @override
  State<ProfileDriver> createState() => _ProfileDriverState();
}

class _ProfileDriverState extends State<ProfileDriver> {
  @override
  void initState() {
    //fetchUserData();
    super.initState();
  }

  String? imgPath;
  void getImage() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      imgPath = sharedPref.getString('image');
    });
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
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
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
                            const Text('Ерхан', style: AppStyles.s20w500),
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
                    text: "Мои поездки",
                    image: AppAssets.images.my_files,
                  ),
                  const Divider(thickness: 1),
                  ProfileElement(
                    onTap: () {
                      // AppNavigator.push(
                      //   context: context,
                      //   page: TournamentView(),
                      // );
                    },
                    color: AppColors.yellow,
                    text: "Турнир",
                    image: AppAssets.images.tournament,
                  ),
                  const Divider(thickness: 1),
                  ProfileElement(
                    color: AppColors.primaryGreen,
                    onTap: () {
                      // AppNavigator.push(
                      //   context: context,
                      //       page: InviteFriendView(),
                      // );
                    },
                    text: "Пригласить друга",
                    image: AppAssets.images.friend,
                  ),
                  const Divider(thickness: 1),
                  ProfileElement(
                    color: AppColors.pink,
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => FeedbackListScreen(),
                      //   ),
                      // );
                    },
                    text: "Обратная связь",
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
            onTap: () {
              LogoutAlertDialog(context);
            },
            title: const Text('Выйти из аккаунта'),
            trailing: const DefaultContainer(
              color: AppColors.lightGray,
              child: Icon(Icons.arrow_forward, color: AppColors.primaryGreen),
            ),
          ),
        ),
      ),
    );
  }
}

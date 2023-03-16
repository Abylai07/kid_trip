import 'package:flutter/material.dart';
import 'package:kid_trip/ui/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_colors.dart';
import '../../constants/navigator.dart';
import '../roles/parent/parent_navigation/parent_navigation.dart';

class CustomSplash extends StatefulWidget {
  const CustomSplash({Key? key}) : super(key: key);
  @override
  State<CustomSplash> createState() => _CustomSplashState();
}

class _CustomSplashState extends State<CustomSplash> {
  Future<void> stateChecker() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          setState(() {
            AppNavigator.pushAndRemove(
              context: context,
              page: const ParentNavigation(),
            );
          });
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 4),
        () {
          setState(() {
            AppNavigator.pushAndRemove(
              context: context,
              page: const LoginScreen(),
            );
          });
        },
      );
    }
  }

  @override
  void initState() {
    stateChecker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainBGColor,
      body: Center(
          child: Text(
        'KidTrip',
        style: TextStyle(fontSize: 26, color: AppColors.whiteTextColor),
      )),
    );
  }
}

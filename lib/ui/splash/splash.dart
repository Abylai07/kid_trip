import 'package:flutter/material.dart';
import 'package:kid_trip/constants/app_styles.dart';
import 'package:kid_trip/ui/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/navigator.dart';
import '../roles/parent/parent_navigation/parent_navigation.dart';
import '../welcome_screen/welcome_screen.dart';

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
              page: const WelcomeScreen(),
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
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.images.splash, width: 300,),
            const SizedBox(height: 24,),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

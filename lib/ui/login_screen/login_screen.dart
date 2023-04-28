import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kid_trip/constants/navigator.dart';
import 'package:kid_trip/ui/roles/child/child_navigation.dart';
import 'package:kid_trip/ui/roles/driver/driver_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../domain/data/end_points.dart';
import '../../domain/get_it_sl.dart';
import '../../generated/l10n.dart';
import '../roles/parent/first_visit_fill/first_fill_profile.dart';
import '../widgets/snack_bars/app_snack_bar_widget.dart';
import 'components/text_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Color buttonColor = Colors.white12;
  Color buttonTextColor = Colors.white54;
  bool passwordVisibility = true;

  var isLogin = false.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AppData api = sl<AppData>();
  signIn() async {
    print('hhhe');
    Map<String, dynamic> data = {
      "username": emailController.text,
      "password": passwordController.text,
    };
    print(data);
    var result = await api.postRequest(
      data: data,
      context: context,
      path: AppData.signIn,
    );
    print(result);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (result != null) {
      prefs.setString('token', result['token']);
      if(result['role'] == 'PARENT') {
        AppNavigator.pushAndRemove(context: context, page: const FirstFillProfile());
      } else if(result['role'] == 'CHILD') {
        AppNavigator.pushAndRemove(context: context, page: const ChildNavigation());
      } else if(result['role'] == 'DRIVER') {
        AppNavigator.pushAndRemove(context: context, page: const DriverNavigation());
      }
      AppSnackBarWidget(
        description: 'Вход успешно выполнен!',
        onPressed: () {},
        color: AppColors.primaryGreen,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBGColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).login,
            style: AppStyles.loginTitleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
              controller: emailController,
              style: const TextStyle(color: AppColors.whiteTextColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  hintText: "Email",
                  hintStyle: const TextStyle(
                    color: Colors.white54,
                  ),
                  fillColor: Colors.white12),
              onChanged: (email){
                setState((){
                  buttonColor = AppColors.whiteTextColor;
                  buttonTextColor = AppColors.mainBGColor;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: passwordVisibility,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
              style: const TextStyle(color: AppColors.whiteTextColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState((){
                        passwordVisibility = !passwordVisibility;
                      });
                    },
                    child: const Icon(
                      Icons.visibility,
                      color: Colors.white,
                    ),
                  ),
                  filled: true,
                  hintText: S.of(context).password,
                  hintStyle: const TextStyle(
                    color: Colors.white54,
                  ),
                  fillColor: Colors.white12
              ),
              onChanged: (password) {
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: buttonTextColor,
                  backgroundColor: buttonColor, // foreground
                ),
                onPressed: () {
                  signIn();
                },
                child: Text(S.of(context).signIn),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextButtons(),
            const SizedBox(
              height: 20,
            ),
            // const LoginWith(),
          ],
        ),
      ),
    );
  }
}



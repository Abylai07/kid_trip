import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kid_trip/constants/navigator.dart';
import 'package:kid_trip/ui/roles/parent/parent_navigation/parent_navigation.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../domain/controllers/login_controller.dart';
import '../../generated/l10n.dart';
import '../roles/driver/driver_navigation/driver_navigation.dart';
import 'components/login_with.dart';
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

  LoginController loginController = Get.put(LoginController());
  var isLogin = false.obs;

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
              controller: loginController.emailController,
              style: const TextStyle(color: AppColors.whiteTextColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  hintText: "E-mail",
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
              controller: loginController.passwordController,
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
                  AppNavigator.push(context: context, page: const DriverNavigation());
                   // loginController.loginWithEmail();
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



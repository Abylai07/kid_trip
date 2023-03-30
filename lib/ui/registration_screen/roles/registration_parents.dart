import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kid_trip/ui/login_screen/components/login_with.dart';
import 'package:kid_trip/ui/registration_screen/components/input_methods.dart';
import 'package:kid_trip/ui/registration_screen/components/submit_button.dart';
import '../../../domain/controllers/registration_controller.dart';
import '../../widgets/alert_dialog/success_alert_dialog.dart';
import '../components/text_buttons_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../generated/l10n.dart';

class RegistrationParents extends StatefulWidget {
  const RegistrationParents({Key? key}) : super(key: key);

  @override
  State<RegistrationParents> createState() => _RegistrationParentsState();
}

class _RegistrationParentsState extends State<RegistrationParents> {
  bool passwordVisibility = true;

  RegistrationController registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        backgroundColor: AppColors.mainBGColor,
      ),
      backgroundColor: AppColors.mainBGColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                '${S.of(context).register} как родитель',
                style: AppStyles.loginTitleStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: registrationController.emailController,
                style: const TextStyle(color: AppColors.whiteTextColor),
                decoration: inputDesign('Email', const Text('')),
                onChanged: (email) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: registrationController.nameController,
                style: const TextStyle(color: AppColors.whiteTextColor),
                decoration: inputDesign('Имя и Фамиля', const Text('')),
                onChanged: (email) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: const TextStyle(color: AppColors.whiteTextColor),
                decoration: inputDesign('+7 777', const Text('')),
                onChanged: (email) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: registrationController.passwordController,
                obscureText: passwordVisibility,
                style: const TextStyle(color: AppColors.whiteTextColor),
                decoration: inputDesign(
                  'Пароль',
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        passwordVisibility = !passwordVisibility;
                      });
                    },
                    child: const Icon(
                      Icons.visibility,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SubmitButton(
                onPressed: () {
                  successAlertDialog(context: context, title: 'Вы успешно зарегистрировались. Ваш аккаут готов к использованию!', buttonText: 'Войти');
                  // registrationController.registerWithEmail();
                },
                title: 'Регистрация',
              ),
              const SizedBox(
                height: 10,
              ),
              const TextButtonsWidget(),
              const SizedBox(
                height: 20,
              ),
              //   const LoginWith(),
            ],
          ),
        ),
      ),
    );
  }
}

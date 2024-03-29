import 'package:flutter/material.dart';
import 'package:kid_trip/ui/login_screen/login_screen.dart';
import 'package:kid_trip/ui/registration_screen/components/input_methods.dart';
import 'package:kid_trip/ui/registration_screen/components/submit_button.dart';
import '../../../constants/navigator.dart';
import '../../../domain/data/end_points.dart';
import '../../../domain/get_it_sl.dart';
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  AppData api = sl<AppData>();
  void signUp() async {
    Map<String, dynamic> data = {
      "username": emailController.text,
      "fullName": nameController.text,
      "gmail": emailController.text,
      "phoneNumber": phoneController.text,
      "password": passwordController.text,
      "role": "PARENT"
    };
    var result = await api.postRequest(
      data: data,
      context: context,
      path: AppData.signUp,
    );
    print(result);
    if (result != null) {
      AppNavigator.pushAndRemove(page: const LoginScreen());
      successAlertDialog(
          context: context,
          title: 'Вы успешно зарегистрировались. Ваш аккаут готов к использованию!',
          buttonText: 'Войти',
        onPressed: () {
            AppNavigator.pop(context: context);
          AppNavigator.push(
              context: context, page: const LoginScreen());
        },
      );
    }
  }

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
                controller: emailController,
                style: const TextStyle(color: AppColors.whiteTextColor),
                decoration: inputDesign('Email', const Text('')),
                onChanged: (email) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: nameController,
                style: const TextStyle(color: AppColors.whiteTextColor),
                decoration: inputDesign('Имя и Фамиля', const Text('')),
                onChanged: (email) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: phoneController,
                style: const TextStyle(color: AppColors.whiteTextColor),
                decoration: inputDesign('+7 777', const Text('')),
                onChanged: (email) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
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
                  signUp();
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

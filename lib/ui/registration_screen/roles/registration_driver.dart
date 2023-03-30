import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kid_trip/ui/registration_screen/components/input_methods.dart';
import 'package:kid_trip/ui/registration_screen/roles/steps/car_data.dart';
import 'package:kid_trip/ui/registration_screen/roles/steps/doc_photo.dart';
import 'package:kid_trip/ui/registration_screen/roles/steps/last_steps.dart';
import 'package:kid_trip/ui/registration_screen/roles/steps/main_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../domain/controllers/registration_controller.dart';
import '../../widgets/alert_dialog/success_alert_dialog.dart';
import '../components/submit_button.dart';

class RegistrationDriver extends StatefulWidget {
  const RegistrationDriver({Key? key}) : super(key: key);

  @override
  State<RegistrationDriver> createState() => _RegistrationDriverState();
}

class _RegistrationDriverState extends State<RegistrationDriver> {
  bool passwordVisibility = true;
  int page = 0;
  final PageController _pageController = PageController(initialPage: 0);

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
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: const ExpandingDotsEffect(
                  expansionFactor: 3,
                  dotHeight: 6,
                  dotWidth: 55,
                  activeDotColor: AppColors.white
                  // strokeWidth: 5,
                  ),
            ),
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            index == 0
                                ? 'Основные данные'
                                : index == 1
                                    ? 'Данные автомобиля'
                                    : index == 2
                                        ? 'Фото документов'
                                        : 'Последний этап',
                            style: AppStyles.s36w500,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          index == 0
                              ? MainData(
                                  nameController:
                                      registrationController.nameController)
                              : index == 1
                                  ? CarData(
                                      nameController:
                                          registrationController.nameController)
                                  : index == 2
                                      ? DocPhoto(
                                          nameController: registrationController
                                              .nameController)
                                      : LastStep(
                                          emailController:
                                              registrationController
                                                  .emailController,
                                          passwordController:
                                              registrationController
                                                  .passwordController,
                                          passwordVisibility:
                                              passwordVisibility,
                                          iconPressed: () {
                                            setState(() {
                                              passwordVisibility =
                                                  !passwordVisibility;
                                            });
                                          }),
                          const SizedBox(
                            height: 14,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SubmitButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                  if(_pageController.page == 3.0){
                    successAlertDialog(context: context, title: 'Вы успешно зарегистрировались. Ваш аккаут готов к использованию!', buttonText: 'Войти');
                  }
                  // registrationController.registerWithEmail();
                },
                title: 'Далее' ,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            // const TextButtonsWidget(),
            // const SizedBox(
            //   height: 20,
            // ),
            // const LoginWith(),
          ],
        ),
      ),
    );
  }
}

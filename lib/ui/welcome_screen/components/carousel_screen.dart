import 'package:flutter/material.dart';
import 'package:kid_trip/constants/app_styles.dart';
import 'package:kid_trip/constants/navigator.dart';
import 'package:kid_trip/ui/login_screen/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  final welcomeList = <String>[
    AppAssets.images.carousel1,
    AppAssets.images.carousel2,
    AppAssets.images.carousel3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 180,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Image.asset(
            AppAssets.images.logo,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: welcomeList.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 24),
                      child: Image.asset(welcomeList[index], height: 350),
                    ),
                    Text(
                      index == 0
                          ? 'Найди работу'
                          : index == 1
                              ? 'Отслеживание местонахождения'
                              : 'Поддержка',
                      style: AppStyles.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        index == 0
                            ? 'Мы поможем найти вам работу через наше приложение'
                            : index == 1
                                ? 'Мы гарантируем безопаность вашем детям'
                                : 'Мы предоставляем службу поддержки для наших пользователей',
                        style: AppStyles.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextButton(onPressed: () {
                      if(index == 2){
                        AppNavigator.push(context: context, page: const LoginScreen());
                      }else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    }, child: Text(index != 2 ? 'Далее': 'Начать', style: AppStyles.titleMediumBold.copyWith(color: AppColors.mainBGColor),)),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SmoothPageIndicator(
            controller: controller,
            count: welcomeList.length,
            effect: const WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thin,
              activeDotColor: AppColors.mainBGColor,
              dotColor: AppColors.grey,
              // strokeWidth: 5,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kid_trip/constants/app_assets.dart';
import 'package:kid_trip/constants/app_styles.dart';
import 'package:kid_trip/constants/navigator.dart';
import 'package:kid_trip/ui/welcome_screen/components/carousel_screen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/app_colors.dart';
import '../../domain/repository/api/repo_settings.dart';
import '../../generated/l10n.dart';
import 'components/start_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).welcome,
              style: AppStyles.s36w500.copyWith(color: AppColors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset(AppAssets.images.splash, width: 300,),
            ),
            Text(
              S.of(context).selectLanguage,
              style: AppStyles.titleLarge.copyWith(color: AppColors.black),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: AppColors.mainBGColor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: DropdownButton<String>(
                  value: Intl.getCurrentLocale(),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                  ),
                  iconEnabledColor: Colors.grey,
                  iconSize: 30,
                  dropdownColor: AppColors.mainBGColor,
                  items: const [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: 'ru',
                      child: Text('Русский'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value == null) return;
                    if (value == 'ru') {
                      S.load(
                        const Locale('ru'),
                      );
                      setState(() {});
                    } else if (value == 'en') {
                      S.load(
                        const Locale('en'),
                      );
                      setState(() {});
                    }
                    final repoSettings =
                        Provider.of<RepoSettings>(context, listen: false);
                    repoSettings.saveLocale(value);
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            StartButton(
              buttonText: S.of(context).start,
              onPressed: () {
               AppNavigator.push(context: context, page: const CarouselScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kid_trip/constants/app_assets.dart';
import 'package:kid_trip/constants/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/app_colors.dart';
import '../../generated/l10n.dart';
import '../../repository/Api/repo_settings.dart';
import 'components/start_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  final welcomeList = <String>[AppAssets.images.kidTaxi, AppAssets.images.kidTaxi,AppAssets.images.kidTaxi];
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        welcomeList.length, (index) => Image.asset(welcomeList[index]),
    );
    return Scaffold(
      backgroundColor: AppColors.mainBGColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).welcome, style: AppStyles.s36w500,),
            SizedBox(
              height: 260,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (_, index) {
                  return pages[index % pages.length];
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: const WormEffect(
                dotHeight: 16,
                dotWidth: 16,
                type: WormType.thin,
                activeDotColor: Colors.white,
                dotColor: Colors.white10
                // strokeWidth: 5,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(S.of(context).selectLanguage, style: AppStyles.s20w500,),
        DropdownButton<String>(
          value: Intl.getCurrentLocale(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          iconEnabledColor: Colors.white,
          iconSize: 20,
          dropdownColor: AppColors.mainBGColor,
          items: const [
            DropdownMenuItem(
              value: 'en',
              child: Text('English'
              ),
            ),
            DropdownMenuItem(
              value: 'ru',
              child: Text('Русский'
              ),
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
            const SizedBox(
              height: 20,
            ),
            StartButton(buttonText: S.of(context).start),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_trip/ui/login_screen/login_screen.dart';
import 'package:kid_trip/ui/registration_screen/roles/registration_driver.dart';
import 'package:kid_trip/ui/registration_screen/roles/registration_parents.dart';
import 'package:kid_trip/ui/registration_screen/registration_screen.dart';
import 'package:kid_trip/domain/get_it_sl.dart' as service_locator;
import 'package:kid_trip/ui/splash/splash.dart';
import 'package:kid_trip/ui/welcome_screen/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'domain/repository/api/repo_settings.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  service_locator.init();
  final repoSettings = RepoSettings();
  await repoSettings.init();
  var defaultLocale = const Locale('ru');
  final locale = await repoSettings.readLocale();
  if (locale == 'en') {
    defaultLocale = const Locale('en');
  }

  runApp(
    KidTrip(
      locale: defaultLocale,
    ),
  );
}

class KidTrip extends StatelessWidget {
  const KidTrip({Key? key, required this.locale}) : super(key: key);
  final Locale locale;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => RepoSettings(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            theme: ThemeData(),
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const CustomSplash(),
              '/welcome_screen': (context) => const WelcomeScreen(),
              '/login_screen': (context) => const LoginScreen(),
              '/registration_screen': (context) => const RegistrationScreen(),
              '/registration_driver': (context) => const RegistrationDriver(),
              '/registration_parents': (context) => const RegistrationParents(),
            },
            initialRoute: '/',
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: locale,
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}

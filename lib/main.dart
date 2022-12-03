import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kid_trip/repository/Api/repo_settings.dart';
import 'package:kid_trip/ui/calculator_screen/calculator_screen.dart';
import 'package:kid_trip/ui/calculator_screen/subscription_screen.dart';
import 'package:kid_trip/ui/child_screen/child_screen.dart';
import 'package:kid_trip/ui/home_screen/home_screen.dart';
import 'package:kid_trip/ui/login_screen/login_screen.dart';
import 'package:kid_trip/ui/navigation/navigation.dart';
import 'package:kid_trip/ui/registration_screen/components/registration_driver.dart';
import 'package:kid_trip/ui/registration_screen/components/registration_parents.dart';
import 'package:kid_trip/ui/registration_screen/registration_screen.dart';
import 'package:kid_trip/ui/settings_screen/settings_screen.dart';
import 'package:kid_trip/ui/welcome_screen/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: GetMaterialApp(
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => WelcomeScreen(),
            '/login_screen': (context) => LoginScreen(),
            '/registration_screen': (context) => RegistrationScreen(),
            '/home_screen': (context) => const HomeScreen(),
            '/subscription_screen': (context) => const SubscriptionScreen(),
            '/settings_screen': (context) => const SettingsScreen(),
            '/calculator_screen': (context) => const CalculatorScreen(),
            '/registration_driver': (context) => RegistrationDriver(),
            '/registration_parents': (context) => const RegistrationParents(),
            //'/navigation': (context) => Navigation(),
            '/child_screen': (context) => ChildScreen(),
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
        ),
    );
  }
}

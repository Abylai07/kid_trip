import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../generated/l10n.dart';


class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  Color buttonColor = Colors.white12;

  Color buttonTextColor = Colors.white54;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: const Icon(Icons.arrow_back_ios_new)),
        backgroundColor: AppColors.mainBGColor,
      ),
      backgroundColor: AppColors.mainBGColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${S.of(context).register} как',
              style: AppStyles.loginTitleStyle,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.mainBGColor,
                  backgroundColor: Colors.white, // foreground
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/registration_driver');
                },
                child: const Text('Водитель'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.mainBGColor,
                  backgroundColor: Colors.white, // foreground
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/registration_parents');
                },
                child: const Text('Родитель'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_styles.dart';
import '../../../generated/l10n.dart';

class LoginWith extends StatelessWidget {
  const LoginWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).loginWith, style: AppStyles.s14w500.merge(const TextStyle(color: Colors.white)),),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.svg.google),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(AppAssets.svg.facebook),
          ],
        )
      ],
    );
  }
}


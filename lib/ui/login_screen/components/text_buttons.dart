import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../registration_screen/registration_screen.dart';

class TextButtons extends StatelessWidget {
  const TextButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
          }, child: Text(S.of(context).signUp),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white54,
          ),
          onPressed: (){},
          child: Text(S.of(context).forgotPassword),
        ),
      ],
    );
  }
}
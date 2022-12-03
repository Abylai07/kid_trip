import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key, required this.buttonText}) : super(key: key);

  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Colors.white,
              shadowColor: Colors.white
            ),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/login_screen');
            }, child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(buttonText,style: AppStyles.s16w500.merge(const TextStyle(color: AppColors.mainBGColor, fontSize: 20)),),
            const SizedBox(
              width: 80,
            ),
            const CircleAvatar(
              backgroundColor: AppColors.mainBGColor,
              child: Icon(Icons.navigate_next, color: Colors.white,),
            ),
          ],
        )),
      ),
    );
  }
}
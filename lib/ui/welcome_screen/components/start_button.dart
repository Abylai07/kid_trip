import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key, required this.buttonText, required this.onPressed}) : super(key: key);

  final String buttonText;
  final Function()? onPressed;
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
                shadowColor: Colors.white),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40),
                Text(
                  buttonText,
                  style: AppStyles.s16w500.merge(const TextStyle(
                      color: AppColors.mainBGColor, fontSize: 20)),
                ),
                const CircleAvatar(
                  backgroundColor: AppColors.mainBGColor,
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

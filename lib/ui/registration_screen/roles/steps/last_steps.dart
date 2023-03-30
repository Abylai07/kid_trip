import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../components/input_methods.dart';

class LastStep extends StatelessWidget {
  const LastStep({
    Key? key,
    required this.emailController,
    required this.passwordVisibility,
    required this.iconPressed,
    required this.passwordController,
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool passwordVisibility;
  final Function() iconPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            style: const TextStyle(color: AppColors.whiteTextColor),
            decoration: inputDesign('Email', const Text('')),
            onChanged: (email) {},
          ),
          const SizedBox(
            height: 14,
          ),
          TextField(
            controller: passwordController,
            obscureText: passwordVisibility,
            style: const TextStyle(color: AppColors.whiteTextColor),
            decoration: inputDesign(
              'Пароль',
              GestureDetector(
                onTap: iconPressed,
                child: const Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          TextField(
            //controller: passwordController,
            obscureText: passwordVisibility,
            style: const TextStyle(color: AppColors.whiteTextColor),
            decoration: inputDesign(
              'Повторите пароль',
              GestureDetector(
                onTap: iconPressed,
                child: const Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

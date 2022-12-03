import 'package:flutter/material.dart';
import 'package:kid_trip/constants/app_styles.dart';

import '../../constants/app_colors.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text('1. 1 car for 1 family', style: AppStyles.s36w500.merge(const TextStyle(color: Colors.black)),),
              const SizedBox(
                height: 20,
              ),
              const Text('Select number of children', style: AppStyles.s16w500),
              const InputText(hintText: '1',),
              const SizedBox(
                height: 10,
              ),
              const Text('Select schedule', style: AppStyles.s16w500),
              const InputText(hintText: 'monday-friday',),
              const SizedBox(
                height: 10,
              ),
              const Text('Select time from', style: AppStyles.s16w500),
              const Text('Choose region', style: AppStyles.s16w500),
              const InputText(hintText: 'Almaty city, Bostandyk'),
              const Text('Input address', style: AppStyles.s16w500),
              const InputText(hintText: 'from'),
              const SizedBox(
                height: 10,
              ),
              const InputText(hintText: 'to'),
              // Row(
              //  children: const [
              //    InputText(hintText: 'from'),
              //    SizedBox(
              //      width: 20,
              //    ),
              //    InputText(hintText: 'to'),
              //  ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputText extends StatelessWidget {
  const InputText({Key? key, required this.hintText}) : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: AppColors.whiteTextColor),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white54,
          ),
          fillColor: AppColors.mainBGColor),
      onChanged: (email){

      },
    );
  }
}

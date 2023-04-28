import 'package:flutter/material.dart';

import '../../../../../../constants/app_assets.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../../../utils/app_utils.dart';
import '../../../../widgets/buttons/outline_button.dart';
import '../../../../widgets/modal_bottom/gender_modal_bottom.dart';
import '../../../../widgets/text_fields/app_text_field.dart';

class ChildInfoInput extends StatelessWidget {
   const ChildInfoInput({Key? key, required this.controller, required this.genderChild, required this.classChild, required this.calendar}) : super(key: key);

  final TextEditingController controller;
  final String genderChild;
  final String classChild;
  final String calendar;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: controller,
          icon: AppAssets.svg.redact,
          hintText: 'Имя и Фамиля',
          enabled: true,
          number: false,
          inputFormatter: [AppUtils.textMaskFormatter],
        ),
        AppTextField(
          controller: controller,
          icon: AppAssets.svg.redact,
          hintText: 'дд.мм.гггг',
          enabled: true,
          number: true,
          inputFormatter: [AppUtils.dateMaskFormatter],
        ),
        OutlineButton(
          gender: genderChild,
          onPressed: () {
            showModalSheet(context, genderChild);
          },
        ),
        OutlineButton(
          gender: classChild,
          onPressed: () {
            showModalSheet(context, classChild);
          },
        ),
        AppTextField(
          controller: controller,
          icon: AppAssets.svg.redact,
          hintText: 'Адрес (пункт A)',
          enabled: true,
          number: true,
          inputFormatter: [AppUtils.dateMaskFormatter],
        ),
        AppTextField(
          controller: controller,
          icon: AppAssets.svg.redact,
          hintText: 'Адрес (пункт В)',
          enabled: true,
          number: true,
          inputFormatter: [AppUtils.dateMaskFormatter],
        ),
        OutlineButton(
          gender: calendar,
          onPressed: () {
            showModalSheet(context, calendar);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: AppColors.darkGray,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: '09:00',
                    ),
                  )
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: AppColors.darkGray,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: '09:00',
                    ),
                  )
              ),
            ],
          ),
        ),
        AppTextField(
          controller: controller,
          icon: AppAssets.svg.redact,
          hintText: 'Номер телефона',
          enabled: true,
          number: true,
          inputFormatter: [AppUtils.phoneMaskFormatter],
        ),
        AppTextField(
          controller: controller,
          icon: AppAssets.svg.redact,
          hintText: 'Придумайте пароль',
          enabled: true,
          number: true,
          inputFormatter: [AppUtils.phoneMaskFormatter],
        ),
      ],
    );
  }
}

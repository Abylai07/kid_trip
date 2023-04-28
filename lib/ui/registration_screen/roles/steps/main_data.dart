import 'package:flutter/material.dart';
import 'package:kid_trip/constants/app_styles.dart';
import 'package:kid_trip/utils/app_utils.dart';

import '../../../../constants/app_colors.dart';
import '../../components/input_methods.dart';

class MainData extends StatefulWidget {
  const MainData({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  State<MainData> createState() => _MainDataState();
}

class _MainDataState extends State<MainData> {
  String dropdownValue = 'Алматы';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            controller: widget.nameController,
            style: const TextStyle(color: AppColors.whiteTextColor),
            decoration: inputDesign('Имя', const Text('')),
            onChanged: (val) {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: TextField(
              //     controller: registrationController.nameController,
              style: const TextStyle(color: AppColors.whiteTextColor),
              decoration: inputDesign('Фамиля', const Text('')),
              onChanged: (val) {},
            ),
          ),
          TextField(
            style: const TextStyle(color: AppColors.whiteTextColor),
            decoration: inputDesign('+7 777 777 77 77', const Text('')),
            onChanged: (val) {},
            keyboardType: TextInputType.number,
            inputFormatters: [AppUtils.phoneMaskFormatter],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: TextField(
              style: const TextStyle(color: AppColors.whiteTextColor),
              decoration: inputDesign('Дата рождения', const Text('')),
              onChanged: (val) {},
              keyboardType: TextInputType.number,
              inputFormatters: [AppUtils.dateMaskFormatter],
            ),
          ),
          DropdownButtonFormField<String>(
            value: dropdownValue,
            iconEnabledColor: AppColors.white,
            dropdownColor: AppColors.mainBGColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: AppColors.lightGray.withOpacity(0.1),
            ),
            items: <String>['Алматы', 'Астана', 'Актобе', 'Кызылорда']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: AppStyles.labelLarge.copyWith(color: AppColors.white),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: TextField(
              style: const TextStyle(color: AppColors.whiteTextColor),
              decoration: inputDesign('Стаж вождения', const Text('')),
              onChanged: (val) {},
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../../utils/app_utils.dart';
import '../../components/input_methods.dart';

class CarData extends StatefulWidget {
  const CarData({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  State<CarData> createState() => _CarDataState();
}

class _CarDataState extends State<CarData> {

  String dropdownValue = 'Серый';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            controller: widget.nameController,
            style: const TextStyle(color: AppColors.whiteTextColor),
            decoration: inputDesign('Автомобиль', const Text('')),
            onChanged: (email) {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: DropdownButtonFormField<String>(
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
              items: <String>['Серый', 'Синий', 'Белый', 'Черный']
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
          ),
          TextField(
            style: const TextStyle(color: AppColors.whiteTextColor),
            decoration: inputDesign('Год выпуска', const Text('')),
            onChanged: (email) {},
            keyboardType: TextInputType.number,
            inputFormatters: [AppUtils.yearMaskFormatter],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: TextField(
              style: const TextStyle(color: AppColors.whiteTextColor),
              decoration: inputDesign('Гос. номер автомобиля', const Text('')),
              onChanged: (email) {},
              inputFormatters: [AppUtils.carNumberMaskFormatter],
            ),
          ),
        ],
      ),
    );
  }
}

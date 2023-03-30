import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kid_trip/constants/app_styles.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/navigator.dart';
import '../../../../utils/app_utils.dart';
import '../../components/input_methods.dart';

class DocPhoto extends StatefulWidget {
  const DocPhoto({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  State<DocPhoto> createState() => _DocPhotoState();
}

class _DocPhotoState extends State<DocPhoto> {
  snackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: AppColors.primaryGreen,
        content: const Text(
          'Успешно!',
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 5),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 170.h,
          right: 24.w,
          left: 24.w,
        ),
      ),
    );
  }

  void cupertinoModal(String type) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              pickImage(source: ImageSource.gallery, type: type);
            },
            child: const Text('Выбрать из галереи'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              pickImage(source: ImageSource.camera, type: type);
            },
            child: const Text('Сделать снимок'),
          )
        ],
      ),
    );
  }

  File? identityCard;
  File? driverCard;
  File? carDocFront;
  File? carDocBack;
  Future pickImage({required ImageSource source, String? type}) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        setState(() {
          type == 'identity'
              ? identityCard = File(image.path)
              : type == 'driver'
                  ? driverCard = File(image.path)
                  : type == 'carFront'
                      ? carDocFront = File(image.path)
                      : carDocBack = File(image.path);
        });
        AppNavigator.pop(context: context);
        return snackBar();
      }
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget.nameController,
            style: const TextStyle(color: AppColors.whiteTextColor),
            decoration: inputDesign('ИИН', const Text('')),
            onChanged: (email) {},
            keyboardType: TextInputType.number,
            inputFormatters: [AppUtils.iinMaskFormatter],
          ),
          const SizedBox(height: 14),
          Text(
            'Удостоврение личности',
            style: AppStyles.titleSmall.copyWith(color: AppColors.white),
          ),
          Text(
            'Лицевая строна',
            style: AppStyles.displayLarge.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cupertinoModal('identity');
                print(identityCard?.path);
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.white),
              child: identityCard?.path == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.image_outlined,
                          color: AppColors.black3,
                        ),
                        Text(
                          'Добавить файл',
                          style: AppStyles.labelMedium
                              .copyWith(color: AppColors.black3),
                        ),
                      ],
                    )
                  : Text(
                      'Добавлено',
                      style: AppStyles.labelMedium
                          .copyWith(color: AppColors.black3),
                    ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Водительские права',
            style: AppStyles.titleSmall.copyWith(color: AppColors.white),
          ),
          Text(
            'Лицевая строна',
            style: AppStyles.displayLarge.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  cupertinoModal('driver');
                  print(driverCard?.path);
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppColors.white),
                child: driverCard?.path == null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.image_outlined,
                            color: AppColors.black3,
                          ),
                          Text(
                            'Добавить файл',
                            style: AppStyles.labelMedium
                                .copyWith(color: AppColors.black3),
                          ),
                        ],
                      )
                    : Text(
                        'Добавлено',
                        style: AppStyles.labelMedium
                            .copyWith(color: AppColors.black3),
                      )),
          ),
          const SizedBox(height: 14),
          Text(
            'Технический паспорт ТС',
            style: AppStyles.titleSmall.copyWith(color: AppColors.white),
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Лицевая строна',
                      style: AppStyles.displayLarge
                          .copyWith(color: AppColors.white),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white),
                        onPressed: () {
                          cupertinoModal('carFront');
                        },
                        child: carDocFront?.path == null
                            ? const Icon(
                                Icons.image_outlined,
                                color: AppColors.black,
                              )
                            : Text(
                                'Добавлено',
                                style: AppStyles.labelMedium
                                    .copyWith(color: AppColors.black3),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Обратная строна',
                      style: AppStyles.displayLarge
                          .copyWith(color: AppColors.white),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white),
                        onPressed: () {
                          cupertinoModal('carBack');
                        },
                        child: carDocBack?.path == null
                            ? const Icon(
                                Icons.image_outlined,
                                color: AppColors.black3,
                              )
                            : Text(
                                'Добавлено',
                                style: AppStyles.labelMedium
                                    .copyWith(color: AppColors.black3),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class AddCardWidget extends StatelessWidget {

  const AddCardWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showBarModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)),
                ),
                expand: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Добавление карты',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ],
    );
  }
}

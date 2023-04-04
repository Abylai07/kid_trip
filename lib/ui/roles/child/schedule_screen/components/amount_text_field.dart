import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountTextFiled extends StatelessWidget {
  const AmountTextFiled({super.key, this.onChanged});
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      cursorColor: Colors.lightBlueAccent,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}


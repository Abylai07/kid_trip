import 'package:flutter/material.dart';

InputDecoration inputDesign(String hintText, Widget? widget) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    filled: true,
    hintText: hintText,
    hintStyle: const TextStyle(
      color: Colors.white54,
    ),
    fillColor: Colors.white12,
    suffixIcon: widget,
  );
}

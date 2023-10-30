import 'package:flutter/material.dart';

class InputTask extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputKeyboardType;
  final String hintText;
  final Image? hintImage;

  const InputTask({
    Key? key,
    required this.controller,
    required this.inputKeyboardType,
    required this.hintText,
    this.hintImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        icon: Image.asset(hintText),
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: inputKeyboardType,
    );
  }
}

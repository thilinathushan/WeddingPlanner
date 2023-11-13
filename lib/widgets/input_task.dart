import 'package:flutter/material.dart';

class InputTask extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputKeyboardType;
  final TextInputAction? textInputAction;
  final String hintText;
  final String? hintImage;
  final Icon? hintIcon;

  const InputTask({
    Key? key,
    required this.controller,
    required this.inputKeyboardType,
    this.textInputAction,
    required this.hintText,
    this.hintImage,
    this.hintIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool chance = true;
    Image? imgHint;
    Icon? iconHint;

    if (hintImage != null && hintIcon == null) {
      imgHint = Image.asset(hintImage!);
      chance = true;
    }
    if (hintImage == null && hintIcon != null) {
      iconHint = hintIcon!;
      chance = false;
    }

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 20),
        icon: chance ? imgHint : iconHint,
        contentPadding: const EdgeInsets.all(10),
        border: InputBorder.none,
      ),
      keyboardType: inputKeyboardType,
      textInputAction: textInputAction,
      style: const TextStyle(fontSize: 20),
    );
  }
}

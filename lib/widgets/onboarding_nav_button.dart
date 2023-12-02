import 'package:flutter/material.dart';
import '../app_style.dart';

class OnboardingNavButton extends StatelessWidget {
  const OnboardingNavButton(
      {super.key,
      required this.name,
      required this.onPressed,
      required this.buttonColor});

  final String name;
  final VoidCallback onPressed;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: kYellowColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 36.0),
        child: Text(
          name,
          style: kTextButton.copyWith(
            backgroundColor: kYellowColor,
            color: buttonColor,
          ),
        ),
      ),
    );
  }
}

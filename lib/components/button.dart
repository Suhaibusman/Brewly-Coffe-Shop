import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;
  final double? buttonWidth;
  final Icon? buttonIcon;

  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.buttonWidth,
      this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: buttonWidth ?? MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: const Color(0xffC67C4E),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: buttonIcon ??
              Text(
                textAlign: TextAlign.center,
                buttonText,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
      ),
    );
  }
}

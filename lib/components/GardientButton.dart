import 'package:flutter/material.dart';
import 'package:smart_factory/constants/colors.dart';
import 'package:smart_factory/constants/styles.dart';

class Gardientbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double horizontal;
  final double vertical;

  const Gardientbutton({
    super.key,
    required this.text,
    required this.onPressed,
    this.horizontal = 12.0,
    this.vertical = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          // Customize colors and direction here
          colors: [mainColor, secondColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusButton),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.transparent, // Make button background transparent
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyles.borderRadiusButton),
          ),
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        ),
        child: Text(
          text.toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_factory/components/Button.dart';
import 'package:smart_factory/constants/colors.dart';

class BoxForm extends StatelessWidget {
  final List<Widget> children;
  const BoxForm({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: bgItemColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_factory/constants/colors.dart';

Row buildTextFieldRow({
  String labelText = 'Default Text',
  bool isEnable = false,
  String hintText = 'Default Hint Text',
  String? valueQR,
  final IconData? icon,
}) {
  Color? fillColor = isEnable ? Colors.white : readInput;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 100,
        margin: const EdgeInsets.all(10),
        child: Text(
          labelText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        child: Container(
          height: 45,
          margin: const EdgeInsets.all(10),
          child: TextField(
            enabled: isEnable,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.grey), // Màu của đường viền
                borderRadius: BorderRadius.circular(10), // Độ cong của góc
              ),
              hintText: hintText,
              fillColor: fillColor,
              filled: true,
              suffixIcon: isEnable ? Icon(icon) : null,
            ),
            controller: TextEditingController(text: valueQR),
          ),
        ),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:smart_factory/constants/colors.dart';

class Dropdownbutton extends StatefulWidget {
  final List<String> items;
  final String? hintText;
  final String? labelText;
  double width;
  Dropdownbutton(
      {super.key,
      required this.items,
      required this.hintText,
      required this.labelText,
      this.width = 100});

  @override
  State<Dropdownbutton> createState() => _DropdownbuttonState();
}

class _DropdownbuttonState extends State<Dropdownbutton> {
  String? valueChoose;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.width,
          margin: const EdgeInsets.all(10),
          child: Text(
            widget.labelText!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 45,
            margin: const EdgeInsets.all(10),
            color: Colors.transparent,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.grey), // Màu của đường viền
                  borderRadius: BorderRadius.circular(10), // Độ cong của góc
                ),
                filled: true,
                fillColor: fieldInput,
                contentPadding: const EdgeInsets.all(10),
              ),
              hint: Text(
                widget.hintText!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              isExpanded: true,
              value: valueChoose,
              style: const TextStyle(
                color: Colors.black,
              ),
              onChanged: (newValue) {
                setState(() {
                  valueChoose = newValue;
                });
              },
              items: widget.items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_factory/constants/colors.dart'; // Import intl package

class DateInput extends StatefulWidget {
  final String labelText;
  final double width;
  const DateInput({super.key, this.labelText = 'Post.Date', this.width = 100});

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  final _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text =
            DateFormat('yyyy-MM-dd').format(picked); // Format the date
      });
    }
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: widget.width,
              margin: const EdgeInsets.all(10),
              child: Text(widget.labelText,
                  style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
            child: Container(
              height: 45,
              margin: const EdgeInsets.all(10),
              child: TextField(
                  controller: _dateController,
                  enabled: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.grey), // Màu của đường viền
                        borderRadius:
                            BorderRadius.circular(10), // Độ cong của góc
                      ),
                      hintText: "yyyy-MM-dd",
                      fillColor: fieldInput,
                      filled: true,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ))),
            ),
          ),
        ],
      );
}

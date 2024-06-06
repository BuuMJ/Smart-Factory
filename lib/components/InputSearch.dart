import 'package:flutter/material.dart';
import 'package:smart_factory/constants/colors.dart';

class InputSearch extends StatefulWidget {
  final Function(String) onSearch;
  final String hintText;
  const InputSearch(
      {super.key, required this.onSearch, required this.hintText});

  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: const Icon(
            Icons.search,
            color: secondColor,
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              widget.onSearch('');
            },
          ),
        ),
        onChanged: widget.onSearch,
      ),
    );
  }
}

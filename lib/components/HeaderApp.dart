import 'package:flutter/material.dart';
import 'package:smart_factory/constants/colors.dart';
import 'package:smart_factory/constants/styles.dart';

class HeaderApp extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HeaderApp({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: bgColor,
      toolbarHeight: 120,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: secondColor,
          size: AppStyles.sizeIconHeader,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: mainColor),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: secondColor,
            size: AppStyles.sizeIconHeader, // Màu của icon thông báo
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

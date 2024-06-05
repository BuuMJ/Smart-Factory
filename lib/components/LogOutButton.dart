import 'package:flutter/material.dart';
import 'package:smart_factory/constants/colors.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void _logout(BuildContext context) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/', // Tên route của màn hình đăng nhập
        (Route<dynamic> route) => false,
      );
    }

    return TextButton.icon(
      onPressed: () => _logout(context),
      label: const SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout,
              size: 20,
              color: Colors.black,
            ),
            SizedBox(width: 6),
            Text(
              'Đăng Xuất',
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

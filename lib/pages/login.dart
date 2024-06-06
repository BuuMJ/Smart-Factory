import 'package:flutter/material.dart';
import 'package:smart_factory/components/GardientButton.dart';
import 'package:smart_factory/constants/colors.dart';
import 'package:smart_factory/routes/routes.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Center(
          child: Image.asset("assets/logofti.png", height: 120, width: 120),
        ),
        toolbarHeight: 120,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/loginbackground.png',
                width: double.infinity,
                height: height / 2.5,
              ),
              Text(
                'Smart Factory'.toUpperCase(),
                style: const TextStyle(
                  color: mainColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 40),
              textFormFieldMethod(
                  "User ID",
                  const Icon(
                    Icons.person,
                    size: 30,
                  ),
                  'Nhập User ID của bạn'),
              const SizedBox(height: 20),
              textFormFieldMethod(
                  "Mật khẩu",
                  const Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  'Nhập mật khẩu của bạn'),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Gardientbutton(
                  text: 'Đăng nhập'.toUpperCase(),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.home);
                  },
                  horizontal: 100,
                  vertical: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textFormFieldMethod(
      String labelText, Icon icon, String hintText) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: icon,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        fillColor: Colors.grey[350],
        filled: true,
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}

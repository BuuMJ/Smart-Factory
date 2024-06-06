import 'package:flutter/material.dart';
import 'package:smart_factory/components/BoxForm.dart';
import 'package:smart_factory/components/Button.dart';
import 'package:smart_factory/components/HeaderApp.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/components/TextFormField.dart';
import 'package:smart_factory/constants/colors.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HeaderApp(title: 'Thông Tin Tài Khoản'),
        body: Container(
          color: bgColor,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavInfoUser(),
              const SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    'Đổi mật khẩu',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BoxForm(
                children: [
                  buildTextFieldRow(
                      labelText: 'User Code: ',
                      hintText: 'User Code',
                      width: 140),
                  buildTextFieldRow(
                      labelText: 'Mật khẩu cũ: ',
                      hintText: 'Mật khẩu cũ',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
                  buildTextFieldRow(
                      labelText: 'Mật khẩu mới: ',
                      hintText: 'Mật khẩu mới',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
                  buildTextFieldRow(
                      labelText: 'Nhập lại mật khẩu: ',
                      hintText: 'Nhập lại mật khẩu',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
                ],
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(right: 12, bottom: 12),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button(text: 'Cập Nhật'.toUpperCase(), onPressed: () {}),
                    const SizedBox(
                      width: 12,
                    ),
                    Button(
                        text: 'Huỷ bỏ'.toUpperCase(),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_factory/components/BoxForm.dart';
import 'package:smart_factory/components/Button.dart';
import 'package:smart_factory/components/HeaderApp.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/components/TextFormField.dart';
import 'package:smart_factory/constants/colors.dart';
import 'package:smart_factory/routes/routes.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  File? _image;
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderApp(title: 'Thông Tin Tài Khoản'),
      body: Container(
        color: bgColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavInfoUser(),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'Thông tin tài khoản:',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BoxForm(
                children: [
                  changeAvatar(),
                  const SizedBox(
                    height: 20,
                  ),
                  buildTextFieldRow(
                      labelText: 'User Code: ', hintText: 'User Code'),
                  buildTextFieldRow(
                    isEnable: true,
                    labelText: 'User Name: ',
                    hintText: 'User Name',
                    icon: Icons.edit,
                  ),
                  buildTextFieldRow(
                    isEnable: true,
                    labelText: 'Số điện thoại: ',
                    hintText: 'Số điện thoại',
                    icon: Icons.edit,
                  ),
                  buildTextFieldRow(
                    isEnable: true,
                    labelText: 'Email: ',
                    hintText: 'Email',
                    icon: Icons.edit,
                  ),
                  buildTextFieldRow(
                    isEnable: true,
                    labelText: 'Địa chỉ: ',
                    hintText: 'Địa chỉ',
                    icon: Icons.edit,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(right: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Button(
                            text: 'Đổi mật khẩu',
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.password);
                            }),
                      ],
                    ),
                  )
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
                          Navigator.popAndPushNamed(context, Routes.home);
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell changeAvatar() {
    return InkWell(
      onTap: _pickImage,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: SizedBox(
                width: 100,
                height: 100,
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : Image.asset(
                        'assets/user_avatar.png',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          Positioned(
              bottom: -10,
              right: -10,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(6),
                  backgroundColor: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}

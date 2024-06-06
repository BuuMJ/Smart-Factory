import 'package:flutter/material.dart';
import 'package:smart_factory/components/BoxForm.dart';
import 'package:smart_factory/components/Button.dart';
import 'package:smart_factory/components/DateInput.dart';
import 'package:smart_factory/components/DropDownButton.dart';
import 'package:smart_factory/components/HeaderApp.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/components/TextFormField.dart';
import 'package:smart_factory/constants/colors.dart';

class QrCode extends StatelessWidget {
  const QrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HeaderApp(title: 'In qr code nguồn gốc'),
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
                    'Thông tin QR Code nguồn gốc',
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
                      labelText: 'Mã sản phẩm: ',
                      hintText: 'Mã sản phẩm',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
                  buildTextFieldRow(
                      labelText: 'Tên sản phẩm: ',
                      hintText: 'Tên sản phẩm',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
                  const DateInput(
                    labelText: 'Ngày sản xuất',
                    width: 140,
                  ),
                  const DateInput(
                    labelText: 'Ngày hết hạn',
                    width: 140,
                  ),
                  buildTextFieldRow(
                      labelText: 'Số lot: ',
                      hintText: 'Số lot',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
                  buildTextFieldRow(
                      labelText: 'Nhà máy: ',
                      hintText: 'Nhà máy',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
                  Dropdownbutton(
                    hintText: 'Máy móc',
                    items: const ['Máy 1', 'Máy 2', 'Máy 3'],
                    labelText: 'Máy móc',
                    width: 140,
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
                    Button(text: 'In'.toUpperCase(), onPressed: () {}),
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

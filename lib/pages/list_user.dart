import 'package:flutter/material.dart';
import 'package:smart_factory/components/BoxForm.dart';
import 'package:smart_factory/components/Button.dart';
import 'package:smart_factory/components/DateInput.dart';
import 'package:smart_factory/components/DropDownButton.dart';
import 'package:smart_factory/components/HeaderApp.dart';
import 'package:smart_factory/components/InputSearch.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/components/Table.dart';
import 'package:smart_factory/components/TextFormField.dart';
import 'package:smart_factory/constants/colors.dart';
import 'package:smart_factory/routes/routes.dart';

class ListUser extends StatefulWidget {
  const ListUser({super.key});

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  final List<User> _users = [
    User(
      id: 3,
      staffCode: 'ST003',
      staffName: 'Nguyễn Xuân Trường',
      position: 'Developer',
      phone: '0702775548',
      address: '215 Nam Kì Khởi Nghĩa, Quận 3',
    ),
    User(
      id: 5,
      staffCode: 'ST005',
      staffName: 'Lê Đình Đông',
      position: 'Developer',
      phone: '0934777377',
      address: '215 Nam Kì Khởi Nghĩa, Quận 3',
    ),
    User(
      id: 5,
      staffCode: 'ST005',
      staffName: 'Lê Đình Đông',
      position: 'Developer',
      phone: '0934777377',
      address: '215 Nam Kì Khởi Nghĩa, Quận 3',
    ),
    User(
      id: 5,
      staffCode: 'ST005',
      staffName: 'Lê Đình Đông',
      position: 'Developer',
      phone: '0934777377',
      address: '215 Nam Kì Khởi Nghĩa, Quận 3',
    ),
    User(
      id: 5,
      staffCode: 'ST005',
      staffName: 'Lê Đình Đông',
      position: 'Developer',
      phone: '0934777377',
      address: '215 Nam Kì Khởi Nghĩa, Quận 3',
    ),
  ];

  List<List<String>> _filteredUsers = [];
  List<String> _headers = [
    'STT',
    'Mã nhân viên',
    'Tên nhân viên',
    'Bộ phận',
    'Sđt',
    'Địa chỉ'
  ];

  @override
  void initState() {
    super.initState();
    _filteredUsers = _users
        .map((user) => [
              user.id.toString(),
              user.staffCode,
              user.staffName,
              user.position,
              user.phone,
              user.address
            ])
        .toList();
  }

  void _filterMachines(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredUsers = _users
            .map((user) => [
                  user.id.toString(),
                  user.staffCode,
                  user.staffName,
                  user.position,
                  user.phone,
                  user.address
                ])
            .toList();
      } else {
        _filteredUsers = _users
            .where((user) =>
                user.id
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                user.staffCode.toLowerCase().contains(query.toLowerCase()) ||
                user.staffName.toLowerCase().contains(query.toLowerCase()) ||
                user.position.toLowerCase().contains(query.toLowerCase()) ||
                user.phone.toLowerCase().contains(query.toLowerCase()) ||
                user.address.toLowerCase().contains(query.toLowerCase()))
            .map((user) => [
                  user.id.toString(),
                  user.staffCode,
                  user.staffName,
                  user.position,
                  user.phone,
                  user.address
                ])
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderApp(title: 'Danh mục máy'),
      body: Container(
        color: bgColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavInfoUser(),
              InputSearch(
                hintText: 'Thông tin nhân viên',
                onSearch: _filterMachines,
              ),
              BoxForm(
                children: [
                  buildTextFieldRow(
                    labelText: 'Mã nhân viên',
                    isEnable: true,
                    icon: Icons.edit,
                  ),
                  buildTextFieldRow(
                    labelText: 'Tên nhân viên',
                    isEnable: true,
                    icon: Icons.edit,
                  ),
                  Dropdownbutton(
                    hintText: 'Bộ phận',
                    labelText: 'Bộ phận',
                    items: const [
                      'Developer',
                      'Triển khai',
                      'HR',
                    ],
                  ),
                  buildTextFieldRow(
                    labelText: 'Số điện thoại',
                    isEnable: true,
                    icon: Icons.edit,
                  ),
                  buildTextFieldRow(
                    labelText: 'Email',
                    isEnable: true,
                    icon: Icons.edit,
                  ),
                  buildTextFieldRow(
                    labelText: 'Địa chỉ',
                    isEnable: true,
                    icon: Icons.edit,
                  ),
                  Dropdownbutton(
                    hintText: 'User Code',
                    labelText: 'User Code',
                    items: const [
                      'ST001',
                      'ST002',
                      'ST003',
                      'ST004',
                      'ST005',
                      'ST006',
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Danh sách nhân viên',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTable(
                        data: _filteredUsers,
                        headers: _headers,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                width: double.infinity,
                color: Colors.transparent,
                margin: const EdgeInsets.only(right: 12, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button(text: 'Thêm mới'.toUpperCase(), onPressed: () {}),
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
}

class User {
  final int id;
  final String staffCode;
  final String staffName;
  final String position;
  final String phone;
  final String address;

  User({
    required this.id,
    required this.staffCode,
    required this.staffName,
    required this.position,
    required this.phone,
    required this.address,
  });
}

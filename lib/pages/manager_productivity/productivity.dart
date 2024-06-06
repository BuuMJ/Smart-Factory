import 'package:flutter/material.dart';
import 'package:smart_factory/components/BoxForm.dart';
import 'package:smart_factory/components/Button.dart';
import 'package:smart_factory/components/HeaderApp.dart';
import 'package:smart_factory/components/InputSearch.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/components/Table.dart';
import 'package:smart_factory/components/TextFormField.dart';
import 'package:smart_factory/constants/colors.dart';
import 'package:smart_factory/routes/routes.dart';

class Productivity extends StatefulWidget {
  const Productivity({super.key});

  @override
  State<Productivity> createState() => _ProductivityState();
}

class _ProductivityState extends State<Productivity> {
  final List<Productivities> _productivitys = [
    Productivities(
      id: 3,
      machineCode: 'ST003',
      machineName: 'Machine 03',
      voltage: 'Vol 1',
      electric: 'Elec 1',
      wattage: '240kw',
    ),
    Productivities(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Productivities(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Productivities(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Productivities(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
  ];
  List<List<String>> _filteredProductivitys = [];
  List<String> _headers = [
    'STT',
    'Mã máy',
    'Tên máy',
    'Điện áp',
    'Dòng điện',
    'Công suất'
  ];
  @override
  void initState() {
    super.initState();
    _filteredProductivitys = _productivitys
        .map((productivity) => [
              productivity.id.toString(),
              productivity.machineCode,
              productivity.machineName,
              productivity.voltage,
              productivity.electric,
              productivity.wattage
            ])
        .toList();
  }

  void _filterPowers(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProductivitys = _productivitys
            .map((productivity) => [
                  productivity.id.toString(),
                  productivity.machineCode,
                  productivity.machineName,
                  productivity.voltage,
                  productivity.electric,
                  productivity.wattage
                ])
            .toList();
      } else {
        _filteredProductivitys = _productivitys
            .where((productivity) =>
                productivity.id
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                productivity.machineCode
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                productivity.machineName
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                productivity.voltage
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                productivity.electric
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                productivity.wattage
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .map((productivity) => [
                  productivity.id.toString(),
                  productivity.machineCode,
                  productivity.machineName,
                  productivity.voltage,
                  productivity.electric,
                  productivity.wattage
                ])
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderApp(title: 'Năng suất máy'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavInfoUser(),
              InputSearch(
                hintText: 'Thông tin năng suất máy',
                onSearch: _filterPowers,
              ),
              BoxForm(children: [
                buildTextFieldRow(
                  labelText: 'Mã máy',
                  hintText: 'Mã máy',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
                buildTextFieldRow(
                  labelText: 'Tên máy',
                  hintText: 'Tên máy',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
                buildTextFieldRow(
                  labelText: 'Công suất',
                  hintText: 'Công suất',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
                buildTextFieldRow(
                  labelText: 'Tốc độ vận hành',
                  hintText: 'Tốc độ vận hành',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
                buildTextFieldRow(
                  labelText: 'Sản lượng ngày',
                  hintText: 'Sản lượng ngày',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
                buildTextFieldRow(
                  labelText: 'Tỷ lệ phát sinh lỗi',
                  hintText: 'Tỷ lệ phát sinh lỗi',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
                buildTextFieldRow(
                  labelText: 'Thời gian xử lý',
                  hintText: 'Thời gian xử lý',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
              ]),
              const SizedBox(
                height: 6,
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
                        'Danh sách năng suất máy',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTable(
                        data: _filteredProductivitys,
                        headers: _headers,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.transparent,
                margin: const EdgeInsets.only(right: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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

class Productivities {
  final int id;
  final String machineCode;
  final String machineName;
  final String voltage;
  final String electric;
  final String wattage;

  Productivities({
    required this.id,
    required this.machineCode,
    required this.machineName,
    required this.voltage,
    required this.electric,
    required this.wattage,
  });
}

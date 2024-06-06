import 'package:flutter/material.dart';
import 'package:smart_factory/components/BoxForm.dart';
import 'package:smart_factory/components/Button.dart';
import 'package:smart_factory/components/DropDownButton.dart';
import 'package:smart_factory/components/HeaderApp.dart';
import 'package:smart_factory/components/InputSearch.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/components/Table.dart';
import 'package:smart_factory/components/TextFormField.dart';
import 'package:smart_factory/constants/colors.dart';
import 'package:smart_factory/routes/routes.dart';

class MachinePower extends StatefulWidget {
  const MachinePower({super.key});

  @override
  State<MachinePower> createState() => _MachinePowerState();
}

class _MachinePowerState extends State<MachinePower> {
  final List<Power> _powers = [
    Power(
      id: 3,
      machineCode: 'ST003',
      machineName: 'Machine 03',
      voltage: 'Vol 1',
      electric: 'Elec 1',
      wattage: '240kw',
    ),
    Power(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Power(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Power(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Power(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
  ];
  List<List<String>> _filteredPowers = [];
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
    _filteredPowers = _powers
        .map((power) => [
              power.id.toString(),
              power.machineCode,
              power.machineName,
              power.voltage,
              power.electric,
              power.wattage
            ])
        .toList();
  }

  void _filterPowers(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredPowers = _powers
            .map((power) => [
                  power.id.toString(),
                  power.machineCode,
                  power.machineName,
                  power.voltage,
                  power.electric,
                  power.wattage
                ])
            .toList();
      } else {
        _filteredPowers = _powers
            .where((power) =>
                power.id
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                power.machineCode.toLowerCase().contains(query.toLowerCase()) ||
                power.machineName.toLowerCase().contains(query.toLowerCase()) ||
                power.voltage.toLowerCase().contains(query.toLowerCase()) ||
                power.electric.toLowerCase().contains(query.toLowerCase()) ||
                power.wattage.toLowerCase().contains(query.toLowerCase()))
            .map((power) => [
                  power.id.toString(),
                  power.machineCode,
                  power.machineName,
                  power.voltage,
                  power.electric,
                  power.wattage
                ])
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderApp(title: 'Điện năng máy'),
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
                hintText: 'Thông tin máy, điện áp, dòng điện',
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
                Dropdownbutton(
                  hintText: 'Điện áp',
                  labelText: 'Điện áp',
                  items: const ['Điện áp 1', 'Điện áp 2'],
                  width: 120,
                ),
                Dropdownbutton(
                  hintText: 'Dòng điện',
                  labelText: 'Dòng điện',
                  items: const ['Dòng điện 1', 'Dòng điện 2'],
                  width: 120,
                ),
                buildTextFieldRow(
                  labelText: 'Công suất tiêu thụ',
                  hintText: 'Công suất tiêu thụ',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
              ]),
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
                        'Danh sách điện năng',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTable(
                        data: _filteredPowers,
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
                margin: const EdgeInsets.only(right: 12, bottom: 12),
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

class Power {
  final int id;
  final String machineCode;
  final String machineName;
  final String voltage;
  final String electric;
  final String wattage;

  Power({
    required this.id,
    required this.machineCode,
    required this.machineName,
    required this.voltage,
    required this.electric,
    required this.wattage,
  });
}

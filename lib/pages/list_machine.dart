import 'package:flutter/material.dart';
import 'package:smart_factory/components/BoxForm.dart';
import 'package:smart_factory/components/Button.dart';
import 'package:smart_factory/components/DateInput.dart';
import 'package:smart_factory/components/HeaderApp.dart';
import 'package:smart_factory/components/InputSearch.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/components/Table.dart';
import 'package:smart_factory/components/TextFormField.dart';
import 'package:smart_factory/constants/colors.dart';

class ListMachine extends StatefulWidget {
  const ListMachine({super.key});

  @override
  _ListMachineState createState() => _ListMachineState();
}

class _ListMachineState extends State<ListMachine> {
  final List<Machine> _machines = [
    Machine(
        id: 3,
        productCode: 'M003',
        productName: 'Machine C',
        location: 'Floor 3',
        employeeInCharge: 'Buu'),
    Machine(
        id: 5,
        productCode: 'M005',
        productName: 'Machine E',
        location: 'Floor 5',
        employeeInCharge: 'Tus'),
    Machine(
        id: 5,
        productCode: 'M005',
        productName: 'Machine E',
        location: 'Floor 5',
        employeeInCharge: 'Tus'),
    Machine(
        id: 5,
        productCode: 'M005',
        productName: 'Machine E',
        location: 'Floor 5',
        employeeInCharge: 'Tus'),
    Machine(
        id: 5,
        productCode: 'M005',
        productName: 'Machine E',
        location: 'Floor 5',
        employeeInCharge: 'Tus'),
  ];

  List<List<String>> _filteredMachines = [];
  List<String> _headers = [
    'STT',
    'Tên sản phẩm',
    'Vị trí',
    'Nhân viên phụ trách'
  ];

  @override
  void initState() {
    super.initState();
    _filteredMachines = _machines
        .map((machine) => [
              machine.productCode,
              machine.productName,
              machine.location,
              machine.employeeInCharge
            ])
        .toList();
  }

  void _filterMachines(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredMachines = _machines
            .map((machine) => [
                  machine.productCode,
                  machine.productName,
                  machine.location,
                  machine.employeeInCharge
                ])
            .toList();
      } else {
        _filteredMachines = _machines
            .where((machine) =>
                machine.productCode
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                machine.productName
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                machine.location.toLowerCase().contains(query.toLowerCase()) ||
                machine.employeeInCharge
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .map((machine) => [
                  machine.productCode,
                  machine.productName,
                  machine.location,
                  machine.employeeInCharge
                ])
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderApp(title: 'Danh mục máy'),
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
                hintText: 'Thông tin máy móc, thiết bị',
                onSearch: _filterMachines,
              ),
              BoxForm(
                children: [
                  buildTextFieldRow(
                      labelText: 'Mã tài sản',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
                  buildTextFieldRow(
                      labelText: 'Tên tài sản',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
                  buildTextFieldRow(
                      labelText: 'Vị trí',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
                  buildTextFieldRow(
                      labelText: 'Nhân viên phụ trách',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
                  const DateInput(labelText: 'Ngày sử dụng', width: 140),
                  buildTextFieldRow(
                      labelText: 'Nhà sản xuất',
                      isEnable: true,
                      icon: Icons.edit,
                      width: 140),
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
                        'Danh sách máy móc, thiết bị',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTable(
                        data: _filteredMachines,
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
                    Button(text: 'Cập Nhật'.toUpperCase(), onPressed: () {}),
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

class Machine {
  final int id;
  final String productCode;
  final String productName;
  final String location;
  final String employeeInCharge;

  Machine({
    required this.id,
    required this.productCode,
    required this.productName,
    required this.location,
    required this.employeeInCharge,
  });
}

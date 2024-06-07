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

class PlanMaintenance extends StatefulWidget {
  const PlanMaintenance({super.key});

  @override
  State<PlanMaintenance> createState() => _PlanMaintenanceState();
}

class _PlanMaintenanceState extends State<PlanMaintenance> {
  final List<Maintenances> _maintenances = [
    Maintenances(
      id: 3,
      machineCode: 'ST003',
      machineName: 'Machine 03',
      voltage: 'Vol 1',
      electric: 'Elec 1',
      wattage: '240kw',
    ),
    Maintenances(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Maintenances(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Maintenances(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Maintenances(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Maintenances(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
  ];
  List<List<String>> _filteredMaintenances = [];
  List<String> _headers = [
    'STT',
    'Tổng sản phẩm',
    'Đã thực hiện',
    'Còn lại',
    'Sản phẩm đạt',
    'Tỷ lệ đạt'
  ];
  @override
  void initState() {
    super.initState();
    _filteredMaintenances = _maintenances
        .map((maintenance) => [
              maintenance.id.toString(),
              maintenance.machineCode,
              maintenance.machineName,
              maintenance.voltage,
              maintenance.electric,
              maintenance.wattage
            ])
        .toList();
  }

  void _filterMaintenances(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredMaintenances = _maintenances
            .map((maintenance) => [
                  maintenance.id.toString(),
                  maintenance.machineCode,
                  maintenance.machineName,
                  maintenance.voltage,
                  maintenance.electric,
                  maintenance.wattage
                ])
            .toList();
      } else {
        _filteredMaintenances = _maintenances
            .where((maintenance) =>
                maintenance.id
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                maintenance.machineCode
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                maintenance.machineName
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                maintenance.voltage
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                maintenance.electric
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                maintenance.wattage.toLowerCase().contains(query.toLowerCase()))
            .map((maintenance) => [
                  maintenance.id.toString(),
                  maintenance.machineCode,
                  maintenance.machineName,
                  maintenance.voltage,
                  maintenance.electric,
                  maintenance.wattage
                ])
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderApp(title: 'lập kế hoạch bảo trì bảo hành'),
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
                hintText: 'Thông tin bảo trì',
                onSearch: _filterMaintenances,
              ),
              BoxForm(children: [
                buildTextFieldRow(
                  labelText: 'Mã tài sản',
                  hintText: 'Mã tài sản',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
                buildTextFieldRow(
                  labelText: 'Tên tài sản',
                  hintText: 'Tên tài sản',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
                Dropdownbutton(
                  items: ['Nhân viên a', 'Nhân viên b', 'Nhân viên c'],
                  hintText: 'Nhân viên phụ trách',
                  labelText: 'Nhân viên phụ trách',
                  width: 120,
                ),
                const DateInput(
                  labelText: 'Ngày bảo trì',
                  width: 120,
                ),
                Dropdownbutton(
                  items: ['Nhân viên a', 'Nhân viên b', 'Nhân viên c'],
                  hintText: 'Trạng thái',
                  labelText: 'Trạng thái',
                  width: 120,
                ),
                buildTextFieldRow(
                  labelText: 'Nội dung',
                  hintText: 'Nội dung',
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
                        'Danh sách bảo trì',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTable(
                        data: _filteredMaintenances,
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

class Maintenances {
  final int id;
  final String machineCode;
  final String machineName;
  final String voltage;
  final String electric;
  final String wattage;

  Maintenances({
    required this.id,
    required this.machineCode,
    required this.machineName,
    required this.voltage,
    required this.electric,
    required this.wattage,
  });
}

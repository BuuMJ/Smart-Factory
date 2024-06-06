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
import 'package:smart_factory/routes/routes.dart';

class ReportProductivity extends StatefulWidget {
  const ReportProductivity({super.key});

  @override
  State<ReportProductivity> createState() => _ReportProductivityState();
}

class _ReportProductivityState extends State<ReportProductivity> {
  final List<Reports> _reports = [
    Reports(
      id: 3,
      machineCode: 'ST003',
      machineName: 'Machine 03',
      voltage: 'Vol 1',
      electric: 'Elec 1',
      wattage: '240kw',
    ),
    Reports(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Reports(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Reports(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Reports(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
    Reports(
      id: 5,
      machineCode: 'ST005',
      machineName: 'Machine 05',
      voltage: 'Vol 2',
      electric: 'Elec 2',
      wattage: '260kw',
    ),
  ];
  List<List<String>> _filteredReports = [];
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
    _filteredReports = _reports
        .map((report) => [
              report.id.toString(),
              report.machineCode,
              report.machineName,
              report.voltage,
              report.electric,
              report.wattage
            ])
        .toList();
  }

  void _filterReports(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredReports = _reports
            .map((report) => [
                  report.id.toString(),
                  report.machineCode,
                  report.machineName,
                  report.voltage,
                  report.electric,
                  report.wattage
                ])
            .toList();
      } else {
        _filteredReports = _reports
            .where((report) =>
                report.id
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                report.machineCode
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                report.machineName
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                report.voltage.toLowerCase().contains(query.toLowerCase()) ||
                report.electric.toLowerCase().contains(query.toLowerCase()) ||
                report.wattage.toLowerCase().contains(query.toLowerCase()))
            .map((report) => [
                  report.id.toString(),
                  report.machineCode,
                  report.machineName,
                  report.voltage,
                  report.electric,
                  report.wattage
                ])
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderApp(title: 'Báo cáo theo dõi năng suất'),
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
                onSearch: _filterReports,
              ),
              BoxForm(children: [
                buildTextFieldRow(
                  labelText: 'Máy',
                  hintText: 'Máy',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
                buildTextFieldRow(
                  labelText: 'Mã hàng',
                  hintText: 'Mã hàng',
                  width: 120,
                  isEnable: true,
                  icon: Icons.edit,
                ),
                const DateInput(
                  labelText: 'Thời gian bắt đầu',
                  width: 120,
                ),
                const DateInput(
                  labelText: 'Thời gian kết thúc',
                  width: 120,
                )
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
                        data: _filteredReports,
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

class Reports {
  final int id;
  final String machineCode;
  final String machineName;
  final String voltage;
  final String electric;
  final String wattage;

  Reports({
    required this.id,
    required this.machineCode,
    required this.machineName,
    required this.voltage,
    required this.electric,
    required this.wattage,
  });
}

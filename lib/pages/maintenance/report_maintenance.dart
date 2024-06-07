import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_factory/components/DateInput.dart';
import 'package:smart_factory/components/HeaderApp.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/constants/colors.dart';

class ReportMaintenance extends StatefulWidget {
  const ReportMaintenance({super.key});

  @override
  State<ReportMaintenance> createState() => _ReportMaintenanceState();
}

class _ReportMaintenanceState extends State<ReportMaintenance> {
  final List<Maintenance> maintenances = [
    Maintenance(name: 'Ngưng sử dụng', percentage: 22.4),
    Maintenance(name: 'Đang bảo trì', percentage: 44.9),
    Maintenance(name: 'Đang sử dụng', percentage: 32.7),
  ];
  final List<Color> colors = [
    const Color(0xff34445C),
    const Color(0xff0476C7),
    secondColor
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderApp(title: 'Báo Cáo Bảo Trì'),
      body: Container(
        height: double.infinity,
        color: bgColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavInfoUser(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DateInput(
                        labelText: 'Từ ngày',
                        width: 70,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: DateInput(
                        labelText: 'Đến ngày',
                        width: 70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              StatefulBuilder(builder: (context, setState) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(top: 40),
                  child: SizedBox(
                    height: 500,
                    child: PieChart(
                      swapAnimationDuration: const Duration(milliseconds: 750),
                      swapAnimationCurve: Curves.easeInOutQuint,
                      PieChartData(
                        sections: maintenances.asMap().entries.map((entry) {
                          int index = entry.key;
                          Maintenance maintenance = entry.value;
                          final color = colors[index % colors.length];
                          return PieChartSectionData(
                            value: maintenance.percentage,
                            title:
                                '${maintenance.name}\n${maintenance.percentage.toStringAsFixed(1)}%',
                            color: color,
                            radius: 100,
                            titleStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        }).toList(),
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class Maintenance {
  final String name;
  final double percentage;
  Maintenance({required this.name, required this.percentage});
}

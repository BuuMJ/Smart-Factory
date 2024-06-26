import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_factory/components/DateInput.dart';
import 'package:smart_factory/components/HeaderApp.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/constants/colors.dart';

class ReportTotalProductivity extends StatefulWidget {
  const ReportTotalProductivity({super.key});

  @override
  State<ReportTotalProductivity> createState() =>
      _ReportTotalProductivityState();
}

class _ReportTotalProductivityState extends State<ReportTotalProductivity> {
  final List<Machine> machines = [
    Machine(name: 'Máy A', sp: 4000),
    Machine(name: 'Máy B', sp: 3000),
    Machine(name: 'Máy C', sp: 2000),
    Machine(name: 'Máy D', sp: 1000),
    Machine(name: 'Máy E', sp: 100),
    Machine(name: 'Máy F', sp: 90),
  ];
  double get maxMachineValue {
    double maxVal = machines.map((e) => e.sp).reduce((a, b) => a > b ? a : b);
    return maxVal +
        10; // Tăng thêm một chút để đảm bảo phần nền có đủ chiều cao
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderApp(title: 'báo cáo tổng hợp năng suất máy'),
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
                    child: BarChart(
                      swapAnimationDuration: const Duration(milliseconds: 750),
                      swapAnimationCurve: Curves.easeInOutQuint,
                      BarChartData(
                        alignment: BarChartAlignment.spaceBetween,
                        barGroups: machines.asMap().entries.map((entry) {
                          int index = entry.key;
                          Machine machine = entry.value;
                          return BarChartGroupData(
                            x: index,
                            barsSpace: 4,
                            barRods: [
                              BarChartRodData(
                                toY: machine.sp,
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent,
                                  ],
                                ),
                                width: 25,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6),
                                ),
                                backDrawRodData: BackgroundBarChartRodData(
                                  show: true,
                                  color: Colors.grey[200],
                                  toY: maxMachineValue,
                                ),
                              )
                            ],
                            showingTooltipIndicators: [0],
                          );
                        }).toList(),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  '${value.toInt()}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                );
                              },
                            ),
                          ),
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: (value, meta) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    machines[value.toInt()].name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        gridData: const FlGridData(show: false),
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

class Machine {
  final String name;
  final double sp;
  Machine({required this.name, required this.sp});
}

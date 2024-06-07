import 'package:flutter/material.dart';
import 'package:smart_factory/pages/admin/account/account.dart';
import 'package:smart_factory/pages/list_user.dart';
import 'package:smart_factory/pages/admin/account/password.dart';
import 'package:smart_factory/pages/admin/data.dart';
import 'package:smart_factory/pages/admin/home.dart';
import 'package:smart_factory/pages/maintenance/plan_maintenance.dart';
import 'package:smart_factory/pages/maintenance/report_maintenance.dart';
import 'package:smart_factory/pages/manager_power/machine_power.dart';
import 'package:smart_factory/pages/list_machine.dart';
import 'package:smart_factory/pages/login.dart';
import 'package:smart_factory/pages/manager_power/report_power.dart';
import 'package:smart_factory/pages/manager_productivity/productivity.dart';
import 'package:smart_factory/pages/manager_productivity/report_productivity.dart';
import 'package:smart_factory/pages/manager_productivity/report_total_productivity.dart';
import 'package:smart_factory/pages/seeds/qr_code.dart';
import 'package:smart_factory/pages/seeds/seek_seeds.dart';
import 'package:smart_factory/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: ThemeData(fontFamily: 'Aptos'),
        routes: {
          Routes.login: (context) => const Login(),
          Routes.home: (context) => const Home(),
          Routes.data: (context) => const Data(),
          Routes.account: (context) => const Account(),
          Routes.password: (context) => const Password(),
          Routes.listMachine: (context) => const ListMachine(),
          Routes.listUser: (context) => const ListUser(),
          Routes.machinePower: (context) => const MachinePower(),
          Routes.reportPower: (context) => const ReportPower(),
          Routes.productivity: (context) => const Productivity(),
          Routes.reportProductivity: (context) => const ReportProductivity(),
          Routes.reportTotalProductivity: (context) =>
              const ReportTotalProductivity(),
          Routes.qrCode: (context) => const QrCode(),
          Routes.seekSeeds: (context) => const SeekSeeds(),
          Routes.planMaintenance: (context) => const PlanMaintenance(),
          Routes.reportMaintenance: (context) => const ReportMaintenance(),
        });
  }
}

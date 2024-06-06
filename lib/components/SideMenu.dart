import 'package:flutter/material.dart';
import 'package:smart_factory/components/LogOutButton.dart';
import 'package:smart_factory/pages/seeds/qr_code.dart';
import 'package:smart_factory/routes/routes.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    const double fontSize = 16;
    const double padLeft = 30;
    const double padTop = 16;
    return Container(
      width: width - 80,
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              right: BorderSide(
            color: Colors.grey,
            width: 2.0,
            style: BorderStyle.solid,
          ))),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Image.asset("assets/logofti.png", height: 120, width: 120),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    dropDownMenu(
                        'Quản trị',
                        fontSize,
                        padLeft,
                        padTop,
                        [
                          itemDropDownMenu(
                              'Thông báo', 'assets/notifications.png',
                              onTap: () {
                            Navigator.pop(context);
                            Scaffold.of(context).closeDrawer();
                          }),
                          itemDropDownMenu(
                              'Đồng bộ dữ liệu', 'assets/merge_data.png',
                              onTap: () {
                            Navigator.pushNamed(context, Routes.data);
                            Scaffold.of(context).closeDrawer();
                          }),
                          itemDropDownMenu(
                            'Thông tin tài khoản',
                            'assets/account.png',
                            onTap: () {
                              Navigator.pushNamed(context, Routes.account);
                              Scaffold.of(context).closeDrawer();
                            },
                          ),
                        ],
                        'assets/admin.png'),
                    const SizedBox(
                      height: 20,
                    ),
                    menuSideBar(
                      'Danh mục máy',
                      'assets/machine_catelog.png',
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.listMachine);
                        Scaffold.of(context).closeDrawer();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    menuSideBar('Danh sách nhân viên', 'assets/list_staff.png',
                        onPressed: () {
                      Navigator.pushNamed(context, Routes.listUser);
                      Scaffold.of(context).closeDrawer();
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    dropDownMenu(
                        'Quản lý điện năng',
                        fontSize,
                        padLeft,
                        padTop,
                        [
                          itemDropDownMenu(
                              'Điện năng máy', 'assets/machine_power.png',
                              onTap: () {
                            Navigator.pushNamed(context, Routes.machinePower);
                            Scaffold.of(context).closeDrawer();
                          }),
                          itemDropDownMenu('Báo cáo tiêu thụ điện năng',
                              'assets/power_report.png', onTap: () {
                            Navigator.pushNamed(context, Routes.reportPower);
                            Scaffold.of(context).closeDrawer();
                          }),
                        ],
                        'assets/power_manager.png'),
                    const SizedBox(
                      height: 20,
                    ),
                    dropDownMenu(
                        'Quản lý năng suất',
                        fontSize,
                        padLeft,
                        padTop,
                        [
                          itemDropDownMenu(
                              'Năng suất máy', 'assets/productive_machine.png',
                              onTap: () {
                            Navigator.pushNamed(context, Routes.productivity);
                            Scaffold.of(context).closeDrawer();
                          }),
                          itemDropDownMenu('Báo cáo theo dõi năng suất máy',
                              'assets/power_report.png', onTap: () {
                            Navigator.pushNamed(
                                context, Routes.reportProductivity);
                            Scaffold.of(context).closeDrawer();
                          }),
                          itemDropDownMenu('Báo cáo tổng hợp năng suất máy',
                              'assets/power_report.png', onTap: () {
                            Navigator.pushNamed(
                                context, Routes.reportTotalProductivity);
                            Scaffold.of(context).closeDrawer();
                          }),
                        ],
                        'assets/productivity_management.png'),
                    const SizedBox(
                      height: 20,
                    ),
                    dropDownMenu(
                        'Truy xuất nguồn gốc',
                        fontSize,
                        padLeft,
                        padTop,
                        [
                          itemDropDownMenu(
                              'In mã QR Code', 'assets/scan_qrcode.png',
                              onTap: () {
                            Navigator.pushNamed(context, Routes.qrCode);
                            Scaffold.of(context).closeDrawer();
                          }),
                          itemDropDownMenu(
                              'Truy xuất nguồn gốc', 'assets/search_origin.png',
                              onTap: () {
                            Navigator.pushNamed(context, Routes.seekSeeds);
                            Scaffold.of(context).closeDrawer();
                          }),
                        ],
                        'assets/info_machine.png'),
                    const SizedBox(
                      height: 20,
                    ),
                    dropDownMenu(
                        'Bảo trì tài sản',
                        fontSize,
                        padLeft,
                        padTop,
                        [
                          itemDropDownMenu(
                              'Kế hoạch bảo trì', 'assets/maintenance_plan.png',
                              onTap: () {
                            Scaffold.of(context).closeDrawer();
                          }),
                          itemDropDownMenu('Báo cáo tổng hợp bảo trì tài sản',
                              'assets/power_report.png', onTap: () {
                            Scaffold.of(context).closeDrawer();
                          }),
                        ],
                        'assets/maintenance_machine.png'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const LogoutButton(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  ExpansionTile dropDownMenu(
    String title,
    double fontSize,
    double padLeft,
    double padTop,
    List<Widget> children,
    String urlIMG,
  ) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: Image.asset(
        urlIMG,
        width: 30,
        height: 30,
      ),
      childrenPadding: EdgeInsets.only(left: padLeft, top: padTop),
      children: children,
    );
  }

  Padding menuSideBar(String title, String urlIMG, {Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Image.asset(
            urlIMG,
            width: 30,
            height: 30,
          ),
          TextButton(
            onPressed: () {
              if (onPressed != null) {
                onPressed();
              }
            },
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  ListTile itemDropDownMenu(String title, String urlIMG, {Function()? onTap}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      leading: Image.asset(
        urlIMG,
        width: 30,
        height: 30,
      ),
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
    );
  }
}

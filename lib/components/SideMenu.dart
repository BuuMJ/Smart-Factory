import 'package:flutter/material.dart';
import 'package:smart_factory/constants/colors.dart';

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child:
                    Image.asset("assets/logofti.png", height: 120, width: 120),
              ),
              const SizedBox(
                height: 40,
              ),
              ExpansionTile(
                title: const Text(
                  'Quản trị',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Image.asset(
                  'assets/admin.png',
                  width: 30,
                  height: 30,
                ),
                childrenPadding:
                    const EdgeInsets.only(left: padLeft, top: padTop),
                children: [
                  itemDropDownMenu('Thông báo', 'assets/notifications.png'),
                  itemDropDownMenu('Đồng bộ dữ liệu', 'assets/merge_data.png'),
                  itemDropDownMenu('Thông tin tài khoản', 'assets/account.png'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              menuSideBar('Danh mục máy', 'assets/machine_catelog.png'),
              const SizedBox(
                height: 20,
              ),
              menuSideBar('Danh sách nhân viên', 'assets/list_staff.png'),
              const SizedBox(
                height: 20,
              ),
              ExpansionTile(
                title: const Text(
                  'Quản lý điện năng',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Image.asset(
                  'assets/power_manager.png',
                  width: 30,
                  height: 30,
                ),
                childrenPadding:
                    const EdgeInsets.only(left: padLeft, top: padTop),
                children: [
                  itemDropDownMenu('Điện năng máy', 'assets/machine_power.png'),
                  itemDropDownMenu(
                      'Báo cáo tiêu thụ điện năng', 'assets/power_report.png'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ExpansionTile(
                title: const Text(
                  'Quản lý năng suất',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Image.asset(
                  'assets/productivity_management.png',
                  width: 30,
                  height: 30,
                ),
                childrenPadding:
                    const EdgeInsets.only(left: padLeft, top: padTop),
                children: [
                  itemDropDownMenu(
                      'Năng suất máy', 'assets/productive_machine.png'),
                  itemDropDownMenu('Báo cáo theo dõi năng suất máy',
                      'assets/power_report.png'),
                  itemDropDownMenu('Báo cáo tổng hợp năng suất máy',
                      'assets/power_report.png'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ExpansionTile(
                title: const Text(
                  'Truy xuất nguồn gốc',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Image.asset(
                  'assets/info_machine.png',
                  width: 30,
                  height: 30,
                ),
                childrenPadding:
                    const EdgeInsets.only(left: padLeft, top: padTop),
                children: [
                  itemDropDownMenu('In mã QR Code', 'assets/scan_qrcode.png'),
                  itemDropDownMenu(
                      'Truy xuất nguồn gốc', 'assets/search_origin.png'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ExpansionTile(
                title: const Text(
                  'Bảo trì tài sản',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Image.asset(
                  'assets/maintenance_machine.png',
                  width: 30,
                  height: 30,
                ),
                childrenPadding:
                    const EdgeInsets.only(left: padLeft, top: padTop),
                children: [
                  itemDropDownMenu(
                      'Kế hoạch bảo trì', 'assets/maintenance_plan.png'),
                  itemDropDownMenu('Báo cáo tổng hợp bảo trì tài sản',
                      'assets/power_report.png'),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton.icon(
                onPressed: () {},
                label: Container(
                  width: double.infinity,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        size: 20,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Đăng Xuất',
                        style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding menuSideBar(String title, String urlIMG) {
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
              print(title);
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

  ListTile itemDropDownMenu(String title, String urlIMG) {
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
        print(title);
      },
    );
  }
}

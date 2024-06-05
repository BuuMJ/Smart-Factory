import 'package:flutter/material.dart';
import 'package:smart_factory/components/LogOutButton.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/components/SideMenu.dart';
import 'package:smart_factory/constants/colors.dart';
import 'package:smart_factory/constants/styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationItem> notificationData = [
      NotificationItem(
        title: 'Thông báo 1',
        machineCode: 'ABC123',
        maintenanceDate: '01/01/2024',
        content: 'Nội dung thông báo 1',
      ),
      NotificationItem(
        title: 'Thông báo 2',
        machineCode: 'XYZ789',
        maintenanceDate: '02/01/2024',
        content: 'Nội dung thông báo 2',
      ),
      NotificationItem(
        title: 'Thông báo 3',
        machineCode: 'DEF456',
        maintenanceDate: '03/01/2024',
        content: 'Nội dung thông báo 3',
      ),
      NotificationItem(
        title: 'Thông báo 4',
        machineCode: 'GHI789',
        maintenanceDate: '04/01/2024',
        content: 'Nội dung thông báo 4',
      ),
      NotificationItem(
        title: 'Thông báo 5',
        machineCode: 'JKL012',
        maintenanceDate: '05/01/2024',
        content: 'Nội dung thông báo 5',
      ),
    ];
    const double padAppbar = 12;
    return Scaffold(
      drawer: const SideMenu(),
      appBar: const Header(padAppbar: padAppbar),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavInfoUser(
              bgColor: thirdColor,
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(left: 12),
              child: const Text(
                'Thông báo:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: notificationData.length,
                    itemBuilder: (BuildContext context, int index) {
                      Color backgroundColor =
                          index.isEven ? bgItemColor : bgColor;
                      return Container(
                        color: backgroundColor,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          title: Text(
                            notificationData[index].title,
                            style: const TextStyle(
                              color: mainColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              span('Mã máy: ',
                                  notificationData[index].machineCode),
                              const SizedBox(
                                height: 8,
                              ),
                              span('Ngày bảo trì: ',
                                  notificationData[index].maintenanceDate),
                              const SizedBox(
                                height: 8,
                              ),
                              span('Nội dung: ',
                                  notificationData[index].content),
                            ],
                          ),
                          trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: Colors.grey), // Đường viền của nút
                              ),
                            ),
                            child: const Text(
                              'Chi Tiết',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            onPressed: () {
                              // Xử lý sự kiện khi nút được nhấn
                              // Ví dụ: mở một hộp thoại, thực hiện một hành động, vv.
                            },
                          ),
                        ),
                      );
                    },
                  ),
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

  RichText span(String title, String nameObj) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: title,
          ),
          TextSpan(
            text: nameObj, // Giá trị động từ notificationData
            style: const TextStyle(
              fontWeight: FontWeight
                  .bold, // Đ // Định dạng nghiêng cho giá trị "machineCode"
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    required this.padAppbar,
  });

  final double padAppbar;

  @override
  _HeaderState createState() => _HeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      title: Center(
        child: Image.asset("assets/logofti.png", height: 120, width: 120),
      ),
      toolbarHeight: 120,
      leading: Padding(
        padding: EdgeInsets.only(left: widget.padAppbar),
        child: IconButton(
          icon: const Icon(
            Icons.menu,
            color: secondColor,
            size: AppStyles.sizeIconHeader,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: widget.padAppbar),
          child: IconButton(
            icon: const Icon(
              Icons.notifications,
              color: secondColor,
              size: AppStyles.sizeIconHeader,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class NotificationItem {
  final String title;
  final String machineCode;
  final String maintenanceDate;
  final String content;

  NotificationItem({
    required this.title,
    required this.machineCode,
    required this.maintenanceDate,
    required this.content,
  });
}

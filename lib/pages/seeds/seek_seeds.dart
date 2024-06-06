import 'package:flutter/material.dart';
import 'package:smart_factory/components/Button.dart';
import 'package:smart_factory/components/DateInput.dart';
import 'package:smart_factory/components/HeaderApp.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/constants/colors.dart';
import 'package:smart_factory/routes/routes.dart';

class SeekSeeds extends StatelessWidget {
  const SeekSeeds({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationItem> notificationData = [
      NotificationItem(
        codeItem: 'Thông báo 1',
        nameItem: 'ABC123',
        dateOfManufacture: '01/01/2024',
        expirationDate: 'Nộ01/01/2024',
        lotNumber: '0120000003',
      ),
      NotificationItem(
          codeItem: 'Thông báo 2',
          nameItem: 'XYZ789',
          dateOfManufacture: '02/01/2024',
          expirationDate: '01/01/2024',
          lotNumber: '0120000003'),
      NotificationItem(
          codeItem: 'Thông báo 3',
          nameItem: 'DEF456',
          dateOfManufacture: '03/01/2024',
          expirationDate: '01/01/2024',
          lotNumber: '0120000003'),
      NotificationItem(
          codeItem: 'Thông báo 4',
          nameItem: 'GHI789',
          dateOfManufacture: '04/01/2024',
          expirationDate: '01/01/2024',
          lotNumber: '0120000003'),
      NotificationItem(
          codeItem: 'Thông báo 5',
          nameItem: 'JKL012',
          dateOfManufacture: '05/01/2024',
          expirationDate: '01/01/2024',
          lotNumber: '0120000003'),
    ];
    return Scaffold(
      appBar: const HeaderApp(title: 'Truy Xuất Nguồn Gốc'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavInfoUser(),
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
            const SizedBox(
              height: 8,
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
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                span('Mã hàng: ',
                                    notificationData[index].codeItem),
                                const SizedBox(
                                  height: 8,
                                ),
                                span('Tên hàng: ',
                                    notificationData[index].nameItem),
                                const SizedBox(
                                  height: 8,
                                ),
                                span('Ngày sản xuất: ',
                                    notificationData[index].dateOfManufacture),
                                const SizedBox(
                                  height: 8,
                                ),
                                span('Ngày hết hạn: ',
                                    notificationData[index].expirationDate),
                                const SizedBox(
                                  height: 8,
                                ),
                                span('Số lot: ',
                                    notificationData[index].lotNumber),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                            trailing:
                                Button(text: 'Chi tiết', onPressed: () {})),
                      );
                    },
                  ),
                ),
              ),
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

class NotificationItem {
  final String codeItem;
  final String nameItem;
  final String dateOfManufacture;
  final String expirationDate;
  final String lotNumber;

  NotificationItem(
      {required this.codeItem,
      required this.nameItem,
      required this.dateOfManufacture,
      required this.expirationDate,
      required this.lotNumber});
}

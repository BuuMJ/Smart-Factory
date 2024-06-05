import 'package:flutter/material.dart';
import 'package:smart_factory/components/HeaderApp.dart';
import 'package:smart_factory/components/NavbarInforUser.dart';
import 'package:smart_factory/constants/colors.dart';

class Data extends StatelessWidget {
  const Data({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MergeDataItem> mergeData = [
      MergeDataItem(
        title: 'Đồng Bộ Dữ Liệu 1',
      ),
      MergeDataItem(
        title: 'Đồng Bộ Dữ Liệu 2',
      ),
      MergeDataItem(
        title: 'Đồng Bộ Dữ Liệu 3',
      ),
      MergeDataItem(
        title: 'Đồng Bộ Dữ Liệu 4',
      ),
      MergeDataItem(
        title: 'Đồng Bộ Dữ Liệu 5',
      ),
    ];
    return Scaffold(
      appBar: const HeaderApp(title: 'Đồng Bộ Dữ Liệu'),
      body: Container(
        color: bgColor,
        height: double.infinity,
        child: Column(
          children: [
            const NavInfoUser(
              bgColor: thirdColor,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mergeData.length,
                    itemBuilder: (BuildContext context, int index) {
                      Color backgroundColor =
                          index.isEven ? bgItemColor : bgColor;
                      return Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: ListTile(
                            title: Text(
                              'Title: ${mergeData[index].title}',
                              style: const TextStyle(
                                color: mainColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.check_circle,
                                color: Color(0xff0CEC1C),
                                size: 40,
                              ),
                              onPressed: () {
                                print(index);
                              },
                            )),
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
}

class MergeDataItem {
  final String title;

  MergeDataItem({
    required this.title,
  });
}

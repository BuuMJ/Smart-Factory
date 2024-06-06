import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<List<String>> data;
  final List<String> headers;

  const CustomTable({
    super.key,
    required this.data,
    required this.headers,
  });

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns = headers
        .map(
          (header) => DataColumn(
            label: Expanded(
              child: Center(
                child: Text(
                  header,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        )
        .toList();
    List<DataRow> rows = data
        .map((rowData) => DataRow(
            cells: rowData
                .map((cell) => DataCell(Center(child: Text(cell))))
                .toList()))
        .toList();
    return DataTable(
      border: TableBorder.all(color: Colors.black, width: 1.0),
      headingRowColor:
          MaterialStateColor.resolveWith((states) => const Color(0xff3C4C5C)),
      columns: columns,
      rows: rows,
    );
  }
}

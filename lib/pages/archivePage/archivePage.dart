import 'dart:math';

import 'package:_04_health_check/widgets/healthAppBar/healthAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class ArchivePage extends StatefulWidget {
  const ArchivePage({super.key});

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  final data = MyData();
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HealthAppBar(),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3),
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Show Record:",
                        style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      style: Theme.of(context).textTheme.bodyLarge,
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          PaginatedDataTable(
            sortColumnIndex: 0,
            columnSpacing: MediaQuery.of(context).size.width / 4,
            source: data,
            columns: [
              DataColumn(
                label: Text("id"),
                onSort: (columnIndex, ascending) => !ascending,
              ),
              DataColumn(label: Text("title")),
              DataColumn(label: Text("price")),
            ],
          ),
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  final _data = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "title $index",
            "price": Random().nextInt(100000000) + 100 * index
          });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]['title'].toString())),
      DataCell(Text(_data[index]['price'].toString())),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

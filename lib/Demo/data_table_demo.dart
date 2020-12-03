import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchDemo'),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              DataTable(
                  columns: [
                    DataColumn(label: Text('Title')),
                    DataColumn(label: Text('Author')),
                  ],
                  rows: [
                    DataRow(
                        cells: [
                          DataCell(Text('Hello~')),
                          DataCell(Text('susu~')),
                        ],
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('apple~')),
                          DataCell(Text('susu~')),
                        ],
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('banana~')),
                          DataCell(Text('susu~')),
                        ],
                    ),


                  ]
              ),
            ],
          ),
      ),
    );
  }
}
